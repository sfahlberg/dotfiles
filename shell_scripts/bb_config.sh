if [ $(hostname) = "sam-workbook.local" ]; then
  eval "$(rbenv init -)"
  source ~/bb/brightbytes/.env
  export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin
fi
