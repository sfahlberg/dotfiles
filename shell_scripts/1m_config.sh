# if [[ $(hostname) =~ '^.+6127.*$' ]]; then
  eval "$(nodenv init -)"

  export ONELIFE_HOME=~/1m/onelife
  export AWS_DEFAULT_REGION=us-east-1
  alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
  export PATH="$HOME/.nodenv/bin:$PATH"
  export PATH="$HOME/.rbenv/shims/2.5.1/bin:$PATH"

  # qual stuff
  alias hkrake="beans exec -a onelife-hk rake"
  alias hkconsole="echo '\n ========= \n are you connected to VPN? \n ========= \n'; beans exec rails console --interactive -a onelife-hk -i ~/.ssh/1life-core.pem"
  alias hkps="beans ps -a onelife-hk"
  alias oldeploy="cd ~/1m/onelife/; beans deploy -a onelife-hk"
  alias uideploy="~/1m/onelife-ui/; gulp deploy --env=hk; chrome 'hk-ui.1life.com/#/patients/100/chart/summaries/new'"

  # docker stuff
  alias dps="docker ps -a"
  alias drc="docker-compose run onelife rails console"
  alias d="docker-compose run onelife"
  alias from_docker="cp ~/1m/onelife/config/database_for_dev.yml ~/1m/onelife/config/database.yml; sed -i "" -e '/config.cache_store/s/# //' ~/1m/onelife/config/environments/development.rb; brew services start --all"
  alias to_docker="cp ~/1m/onelife/config/database_for_docker.yml ~/1m/onelife/config/database.yml; sed -i '' -e's/config.cache_store/# &/' ~/1m/onelife/config/environments/development.rb; brew services stop --all"

  alias ol="title onelife; ~/1m/onelife"
  alias olv="title onelife; ~/1m/onelife; vi"
  alias ols="title onelife server; ~/1m/onelife; bundle; bundle exec rake db:migrate; rails s"
  alias olt="title onelife; ~/1m/onelife; bundle; bin/rails db:migrate RAILS_ENV=test; zeus start"

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
