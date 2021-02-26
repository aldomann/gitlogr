#' Get Git commit history
#'
#' Get your Git commit history as a data frame or raw text between two specified dates
#'
#' @param from Starting date
#' @param to Ending date
#' @param author Optional author of the commits
#' @param raw Whether the output is a raw string vector (TRUE), or a data frame (FALSE)
#' @param path Optional path of your Git reporitory
#'
#' @keywords git
#' @export
#' @examples
#' get_git_commit_history(from = "2019-06-01")

get_git_commit_history <- function(from, to = Sys.Date(), author = NULL, path = NULL, raw = FALSE) {
  git_commits <- system(
    paste(
      "git",
      ifelse(is.null(path), "", paste0("--git-dir ", path %>% stringr::str_remove("/$"), "/.git")),
      "log",
      ifelse(is.null(author), "", paste("--author", author)),
      "--since", lubridate::as_date(from) - 1,
      "--until", to,
      "--reverse",
      "--pretty='%Cgreen %cI ## %Creset %s'"
    ),
    intern = TRUE
  )

  if (!raw) {
    git_commits <- data.frame(
      lines = git_commits
    ) %>%
      tidyr::separate(
        col = .data$lines,
        into = c("date", "message"),
        sep = "##"
      ) %>%
      dplyr::mutate(
        date = lubridate::ymd_hms(.data$date),
        message = stringr::str_trim(.data$message, side = "left")
      )
  }

  return(git_commits)
}
