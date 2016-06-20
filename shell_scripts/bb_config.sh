if [ $(hostname) != "Samuels-MacBook-Air.local" ]; then
  eval "$(rbenv init -)"
  source ~/bb/brightbytes/.env
  export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin
fi
