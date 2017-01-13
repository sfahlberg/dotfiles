update-resume() {
# copy to google drive
  cp ~/Downloads/sam_fahlberg_resume.docx.pdf ~/Google\ Drive/archive/search/sam_fahlberg_resume.pdf
# move to website and push changes
  mv ~/Downloads/sam_fahlberg_resume.docx.pdf ~/Documents/sfahlberg.github.io/resume.pdf
  cd ~/Documents/sfahlberg.github.io
  git add -A
  git commit -m "update resume"
  git push
  cd
}
