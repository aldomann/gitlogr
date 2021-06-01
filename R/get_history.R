#' Get Git commit history
#'
#' Get your Git commit history as a data frame or raw text between two specified dates.
#'
#' @param from Starting date.
#' @param to Ending date.
#' @param author Optional author of the commits.
#' @param path Optional path of your Git repository.
#' @param raw Whether the output is a raw string vector (\code{TRUE}), or a data frame (\code{FALSE}).
#' @param clipboard If \code{TRUE}, the output will also be copied into the clipboard.
#'
#' @keywords git
#' @examples
#' get_history(from = "2019-06-01")
#' @importFrom rlang .data
#' @export
get_history <- function(from, to = Sys.Date(), author = NULL, path = NULL, raw = FALSE, clipboard = FALSE) {

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
    " --until {lubridate::as_date(from) + 1}",
    " --reverse",
    " --pretty='%Cgreen %cI ## %Creset %s'"
  )

  # Get commits
  git_commits <- system(call, intern = TRUE) %>%
    stringr::str_trim(side = "left")

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
      ) %>%
      dplyr::filter(
        dplyr::between(as.Date(.data$date), as.Date(from), as.Date(to))
      ) %>%
      dplyr::as_tibble()
  }

  if (clipboard) {
    clipr::write_clip(git_commits)
  }

  return(git_commits)
}

#' @rdname get_history
#' @export
get_git_commit_history <- get_history
