if [ $(hostname) = "sam-workbook.local" ]; then
  source ~/bb/clarity/.env
  source ~/bb/insights-cms/.env
  test -s "$HOME/.kiex/scripts/kiex" && source "$HOME/.kiex/scripts/kiex"

  alias c="~/bb/clarity"
  alias cv="~/bb/clarity; vi"
  alias cz="~/bb/clarity; zeus start"

  alias cew="~/bb/clarity_early_warning"
  alias csd="~/bb/clarity_survey_data"

  export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin
  export PATH=$PATH:node_modules/.bin

  export PATH="$HOME/.yarn/bin:$PATH"

  export NVM_DIR="/Users/sam/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
fi
