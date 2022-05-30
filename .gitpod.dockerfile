FROM gitpod/workspace-base:latest

### Terminal Setup ###
RUN ["sudo", "apt-get", "update"]

## Setting ZSH ###
RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.2/zsh-in-docker.sh)" -- \
  -t https://github.com/denysdovhan/spaceship-prompt \
  -a 'SPACESHIP_PROMPT_ADD_NEWLINE="false"' \
  -a 'SPACESHIP_PROMPT_SEPARATE_LINE="false"' \
  -a 'SPACESHIP_USER_SHOW=always' \
  -a 'SPACESHIP_CHAR_SYMBOL="❯"' \
  -a 'SPACESHIP_CHAR_SUFFIX=" "' \
  -a 'SPACESHIP_PROMPT_ORDER=( \n\
  user          # Username section \n\
  dir           # Current directory section \n\
  host          # Hostname section \n\
  git           # Git section (git_branch + git_status) \n\
  hg            # Mercurial section (hg_branch  + hg_status) \n\
  exec_time     # Execution time \n\
  line_sep      # Line break \n\
  vi_mode       # Vi-mode indicator \n\
  jobs          # Background jobs indicator \n\
  exit_code     # Exit code section \n\
  char          # Prompt character \n\
  )' \
  -p git \
  -p python \
  -p pip \
  -p https://github.com/zsh-users/zsh-autosuggestions \
  -p https://github.com/zsh-users/zsh-completions \
  -p https://github.com/zsh-users/zsh-history-substring-search \
  -p https://github.com/zsh-users/zsh-syntax-highlighting \
  -p 'history-substring-search' 

ENTRYPOINT [ "/bin/zsh" ]
CMD ["-l"]