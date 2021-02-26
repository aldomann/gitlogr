#' Get Git Commit Count
#'
#' Get your Git commit count in a single date or range of dates
#'
#' @param from Date to count commits from.
#' @param to Optional ending date if you want to count commits in a date range.
#' @param author Optional author of the commits.
#' @param path Optional path of your Git reporitory.
#'
#' @keywords git
#' @examples
#' get_git_commit_count(from = "2019-06-01")
#' @importFrom rlang .data
#' @export
get_git_commit_count <- function(from, to = NULL, author = NULL, path = NULL) {
  if (is.null(to)) {
    date_range <- from
  } else {
    date_range <- as.character(seq(as.Date(from), as.Date(to), 1))
  }

  commit_count <- gitlogr::get_git_commit_history(
    from = from,
    to = to,
    author = author,
    path = path
  ) %>%
    tidyr::separate(
      col = .data$date,
      into = c("date", "time"), sep = " ") %>%
    dplyr::group_by(.data$date) %>%
    dplyr::summarise("count" = dplyr::n()) %>%
    dplyr::filter(.data$date %in% date_range) %>%
    dplyr::pull("count") %>%
    sum()

  if (length(commit_count) == 0) {
    commit_count <- 0
  }

  return(commit_count)
}
