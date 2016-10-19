if [ $(hostname) = "sam-workbook.local" ]; then
  alias bbv="cd ~/bb/brightbytes; vi"
  alias bb="cd ~/bb/brightbytes"
  source ~/bb/brightbytes/.env
  export GOPATH=$HOME/goworkspace/
  export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin:$GOPATH/bin
  export PATH=$PATH:/Users/sam/bb/brightbytes/node_modules/.bin
fi
