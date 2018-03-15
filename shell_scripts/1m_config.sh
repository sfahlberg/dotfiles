if [ $(hostname) = "m-6127.omg.lan" ]; then
  export ONELIFE_HOME=~/1m/onelife
  export AWS_REGION=us-east-1
  export AWS_DEFAULT_REGION=us-east-1

  # docker stuff
  alias dps="docker ps -a"
  alias dbash="docker exec -it devkit bash"
  alias drs="docker exec -it devkit rails s -b 0.0.0.0"
  alias dstart="docker start  `docker ps -q -l`" # restart exited container
  alias drun="docker run --name devkit -d -p 3000:3000 -p 3306:3306 -p 9200:9200 -p 6379:6379 -v $ONELIFE_HOME:/onelife -v mysql:/var/lib/mysql -v elasticsearch:/var/lib/elasticsearch -v bundler:/var/lib/bundle 193567999519.dkr.ecr.us-east-1.amazonaws.com/onemedical/onelife-devkit"

  alias ol="~/1m/onelife"
  alias olv="~/1m/onelife; vi"
  alias ols="dstart; drs;"

  alias ui="~/1m/onelife-ui"
  alias uis="~/1m/onelife-ui; npm install; npm start"
  alias uiv="~/1m/onelife-ui; vi"
  alias uideploy="~/1m/onelife-ui/; gulp deploy --env=hk"

  alias mw="~/1m/mobile-web"
  alias mws="~/1m/mobile-web; npm start"
  alias mwv="~/1m/mobile-web; vi"
fi
