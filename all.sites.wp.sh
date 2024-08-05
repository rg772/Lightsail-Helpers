for I in `ls -d /opt/bitnami/SITES/*.edu`
  do
  echo
  cd $I
  wp 2>/dev/null option get home
  wp 2>/dev/null $*
  sleep 1
done
