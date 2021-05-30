#' Get Git commit history
#'
#' Get your Git commit history as a data frame or raw text between two specified dates.
#'
#' @param from Starting date.
#' @param to Ending date.
#' @param author Optional author of the commits.
#' @param raw Whether the output is a raw string vector (\code{TRUE}), or a data frame (\code{FALSE}).
#' @param path Optional path of your Git repository.
#'
#' @keywords git
#' @export
#' @examples
#' get_git_commit_history(from = "2019-06-01")
get_git_commit_history <- function(from, to = Sys.Date(), author = NULL, path = NULL, raw = FALSE) {

  # Parse path
  path <- ifelse(
    is.null(path),
    "",
    glue::glue(" --git-dir {stringr::str_remove(path, '/$')}/.git")
  )

  # Parse author
  author <- ifelse(
    is.null(author),
    "",
    glue::glue(" --author {author}")
  )

  # Construct system call
  call <- glue::glue(
    "git",
    path,
    " log",
    author,
    " --since {lubridate::as_date(from) - 1}",
    " --until {to}",
    " --reverse",
    " --pretty='%Cgreen %cI ## %Creset %s'"
  )
  message(call)

  # Get commits
  git_commits <- system(call, intern = TRUE) %>%
    stringr::str_trim(side = "left")

  if (!raw) {
    git_commits <- data.frame(
      lines = git_commits
    ) %>%
      tidyr::separate(
        col = "lines",
        into = c("date", "message"),
        sep = "##"
      ) %>%
      dplyr::mutate(
        date = lubridate::ymd_hms(date),
        message = stringr::str_trim(message, side = "left")
      ) %>%
      dplyr::filter(
        dplyr::between(as.Date(date), as.Date(from), as.Date(to))
      )
  }

  return(git_commits)
}
