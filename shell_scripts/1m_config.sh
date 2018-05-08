if [ $(hostname) = "M-6127.local" ]; then
  export ONELIFE_HOME=~/1m/onelife
  export AWS_DEFAULT_REGION=us-east-1
  alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"

  # qual stuff
  alias hkrake="beans exec -a onelife-hk rake"
  alias hkconsole="echo '\n ========= \n are you connected to VPN? \n ========= \n'; beans exec rails console --interactive -a onelife-hk -i ~/.ssh/1life-core.pem"
  alias hkps="beans ps -a onelife-hk"
  alias oldeploy="cd ~/1m/onelife/; beans deploy -a onelife-hk"
  alias uideploy="~/1m/onelife-ui/; gulp deploy --env=hk; chrome 'hk-ui.1life.com/#/patients/100/chart/summaries/new'"

  # docker stuff
  alias dps="docker ps -a"
  alias dbash="docker exec -it devkit bash"
  alias drs="docker exec -it devkit rails s -b 0.0.0.0"
  alias dstart="docker start  \`docker ps -q -l\`" # restart exited container
  alias drun="docker run --name devkit -d -p 3000:3000 -p 3306:3306 -p 9200:9200 -p 6379:6379 -v $ONELIFE_HOME:/onelife -v mysql:/var/lib/mysql -v elasticsearch:/var/lib/elasticsearch -v bundler:/var/lib/bundle 193567999519.dkr.ecr.us-east-1.amazonaws.com/onemedical/onelife-devkit"

  alias ol="title ol; ~/1m/onelife"
  alias olv="title ol; ~/1m/onelife; vi"
  alias ols="title ol; ~/1m/onelife; bundle; bundle exec rake db:migrate; rails s"
  alias olt="title ol; ~/1m/onelife; bundle; bin/rails db:migrate RAILS_ENV=test; zeus start"

  alias ui="title ui; ~/1m/onelife-ui"
  alias uis="title ui; ~/1m/onelife-ui; gulp clean; npm install; npm start"
  alias uiv="title ui; ~/1m/onelife-ui; vi"
  alias uit="~/1m/onelife-ui/; npm run tdd"

  alias mw="~/1m/mobile-web"
  alias mws="~/1m/mobile-web; npm start"
  alias mwv="~/1m/mobile-web; vi"
fi
