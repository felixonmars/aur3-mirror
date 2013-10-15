export JAIHOME=$JAVA_HOME/lib
export CLASSPATH=$JAIHOME/jai_core.jar:$JAIHOME/jai_codec.jar:$JAIHOME/mlibwrapper_jai.jar:$CLASSPATH
export LD_LIBRARY_PATH=.:$JAIHOME:$LD_LIBRARY_PATH