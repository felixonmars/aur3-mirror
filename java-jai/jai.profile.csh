setenv JAIHOME $JAVA_HOME/lib
setenv CLASSPATH $JAIHOME/jai_core.jar:$JAIHOME/jai_codec.jar:$JAIHOME/mlibwrapper_jai.jar:$CLASSPATH
setenv LD_LIBRARY_PATH .:$JAIHOME:$LD_LIBRARY_PATH