# Location of WildFly
export JBOSS_HOME=/usr/share/jboss-as

# Application server mode (standalone/domain)
export JBOSS_MODE=standalone

# Configuration for standalone mode
export JBOSS_CONFIG=standalone.xml

# Configuration for domain mode
export JBOSS_DOMAIN_CONFIG=domain.xml
export JBOSS_HOST_CONFIG=host-master.xml

# The username who should own the process.
export JBOSS_USER=jboss-as

# PID file
export JBOSS_PIDFILE=/run/jboss-as/jboss-as.pid

# Console log
export JBOSS_CONSOLE_LOG=/var/log/jboss-as/console.log



