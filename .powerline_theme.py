from powerline_shell.themes.default import DefaultColor


class Color(DefaultColor):
    """Basic theme which only uses colors in 0-15 range"""
    USERNAME_FG = 7
    USERNAME_BG = 4
    USERNAME_ROOT_BG = 2

    HOSTNAME_FG = 7
    HOSTNAME_BG = 4

    HOME_SPECIAL_DISPLAY = False
    PATH_BG = 7
    PATH_FG = 0
    CWD_FG = 0
    SEPARATOR_FG = 0

    READONLY_BG = 1
    READONLY_FG = 15

    REPO_CLEAN_BG = 2
    REPO_CLEAN_FG = 0
    REPO_DIRTY_BG = 3
    REPO_DIRTY_FG = 0

    JOBS_FG = 0
    JOBS_BG = 2

    CMD_PASSED_BG = 2
    CMD_PASSED_FG = 0
    CMD_FAILED_BG = 1
    CMD_FAILED_FG = 0

    SVN_CHANGES_BG = REPO_DIRTY_BG
    SVN_CHANGES_FG = REPO_DIRTY_FG

    VIRTUAL_ENV_BG = 2
    VIRTUAL_ENV_FG = 0

    AWS_PROFILE_FG = 14
    AWS_PROFILE_BG = 7

    TIME_FG = 8
    TIME_BG = 7
