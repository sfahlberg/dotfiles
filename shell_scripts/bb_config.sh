if [ $(hostname) = "sam-workbook.local" ]; then
  alias bbv="cd ~/bb/brightbytes; vi"
  alias bb="cd ~/bb/brightbytes"
  source ~/bb/brightbytes/.env
  export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin
fi
