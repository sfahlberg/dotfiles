if [ $(hostname) = "sam-workbook.local" ]; then
  alias cc="cd ~/bb/clarity"
  alias ccv="cd ~/bb/clarity; vi"
  alias ccz="cd ~/bb/clarity; zeus start"
  source ~/bb/clarity/.env
  export GOPATH=$HOME/goworkspace/
  export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin:$GOPATH/bin
  export PATH=$PATH:/Users/sam/bb/brightbytes/node_modules/.bin
fi
