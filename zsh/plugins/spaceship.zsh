autoload -U promptinit; promptinit
prompt spaceship
SPACESHIP_PROMPT_ORDER=(
  time          # Time stamps section
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
	line_sep
  git           # Git section (git_branch + git_status)
  exec_time     # Execution time
  exit_code     # Exit code section
  char          # Prompt character
)
