# if [[ $(hostname) =~ '^.+6127.*$' ]]; then
  eval "$(nodenv init -)"

  export ONELIFE_HOME=~/1m/onelife
  export AWS_DEFAULT_REGION=us-east-1
  alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
  export PATH="$HOME/.nodenv/bin:$PATH"
  export PATH="$HOME/.rbenv/shims/2.5.1/bin:$PATH"

  # qual stuff
  alias newtowndeploy="git rev-parse --abbrev-ref HEAD | xargs crane deploy -e alpha -c newtown --onelife-rails; alert"
  alias hkdeploy="git rev-parse --abbrev-ref HEAD | xargs crane deploy -e alpha -c hk-ecs --onelife-rails; alert"
  alias marindeploy="git rev-parse --abbrev-ref HEAD | xargs crane deploy -e alpha -c marin --onelife-rails; alert"

  # docker stuff
  alias dattach='docker attach $(docker ps | grep "onelife_onelife_1" | awk '"'"'{print $1;}'"'"')'
  alias drc="docker-compose run onelife rails console"
  alias d="docker-compose run onelife"
  alias from_docker="cp ~/1m/onelife/config/database_for_dev.yml ~/1m/onelife/config/database.yml; sed -i "" -e '/config.cache_store/s/# //' ~/1m/onelife/config/environments/development.rb; brew services start --all"
  alias to_docker="cp ~/1m/onelife/config/database_for_docker.yml ~/1m/onelife/config/database.yml; sed -i '' -e's/config.cache_store/# &/' ~/1m/onelife/config/environments/development.rb; brew services stop --all"

  alias ol="title onelife; ~/1m/onelife"
  alias olv="title onelife; ~/1m/onelife; vi"

  alias dp="title doc-processing; ~/1m/document-processing"
  alias dpv="title doc-processing; ~/1m/document-processing; vi"

  alias pub="title pub-sub; ~/1m/pub-sub"
  alias pubv="title pub-sub; ~/1m/pub-sub; vi"

  alias ui="title ui; ~/1m/onelife-ui"
  alias uis="title ui; ~/1m/onelife-ui; lsof -t -i tcp:4000 | xargs kill; gulp clean; npm install; npm start"
  alias uiv="title ui; ~/1m/onelife-ui; vi"
  alias uit="~/1m/onelife-ui/; lsof -t -i tcp:4000 | xargs kill; npm run tdd"

  alias mw="title mw; ~/1m/mobile-web"
  alias mws="title mw; ~/1m/mobile-web; npm start"
  alias mwv="title mw; ~/1m/mobile-web; vi"
# fi
