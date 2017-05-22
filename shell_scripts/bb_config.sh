if [ $(hostname) = "sam-workbook.local" ]; then
  source ~/bb/clarity/.env
  export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin
fi
