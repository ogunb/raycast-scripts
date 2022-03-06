app_name=$*
if [[ $(pgrep "$app_name") ]]; then
  echo true
else
  echo false
fi
