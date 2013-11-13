if [ $LD_LIBRARY_PATH ]
then
  if ! set | grep LD_LIBRARY_PATH | grep /opt/AMDAPP/SDK/lib/ > /dev/null
  then
    LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/AMDAPP/SDK/lib/
    export LD_LIBRARY_PATH
  fi
else
  LD_LIBRARY_PATH=/opt/AMDAPP/SDK/lib/
  export LD_LIBRARY_PATH
fi