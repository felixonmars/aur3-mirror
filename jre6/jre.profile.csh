setenv PATH ${PATH}:/opt/java6/jre/bin
if (! "$?JAVA_HOME" ) then
  setenv JAVA_HOME /opt/java6/jre
endif
