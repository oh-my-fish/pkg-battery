function battery.info.update
  test -z "$OSTYPE"; and set OSTYPE (uname)
  if test $OSTYPE = "Darwin"
    battery.info.update.darwin
  else if test $OSTYPE = "Linux"
    battery.info.update_linux
  else
    echo "Unknown operating system: $OSTYPE"
  end
end
