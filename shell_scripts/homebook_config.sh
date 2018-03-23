if [ $(hostname) = "sam-homebook.local" ]; then
  # The next line updates PATH for the Google Cloud SDK.
  if [ -f '/Users/fahlberg/Downloads/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/fahlberg/Downloads/google-cloud-sdk/path.zsh.inc'; fi

  # The next line enables shell command completion for gcloud.
  if [ -f '/Users/fahlberg/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/fahlberg/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
fi
