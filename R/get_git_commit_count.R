#' Get Git commit count
#'
#' Get your Git commit count in a single date or range of dates
#'
#' @param from Date to count commits from
#' @param to Optional ending date if you want to count commits in a date range
#' @param author Optional author of the commits
#' @param path Optional path of your Git reporitory
#'
#' @keywords git
#' @export
#' @examples
#' get_git_commit_count(from = "2019-06-01")

get_git_commit_count <- function(from, to = NULL, author = NULL, path = NULL) {
  if (is.null(to)) {
    date_range <- from
  } else {
    date_range <- base::seq(base::as.Date(from), base::as.Date(to), 1) %>%
      base::as.character()
  }

  commit_count <- gitlogr::get_git_commit_history(
    from = from,
    to = to,
    author = author,
    path = path
  ) %>%
    tidyr::separate(date, into = c("date", "time"), sep = " ") %>%
    dplyr::group_by(date) %>%
    dplyr::summarise("count" = dplyr::n()) %>%
    dplyr::filter(date %in% date_range) %>%
    dplyr::pull("count") %>%
    base::sum()

  if (base::length(commit_count) == 0) {
    commit_count <- 0
  }

  return(commit_count)
}
