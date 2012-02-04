# Contributor: Jakub Schmidtke <sjakub-at-gmail.com>

pkgname=hadoop-svn
pkgver=764287
pkgrel=1
_devver=0.21.0-dev
pkgdesc="Hadoop - MapReduce implementation and distributed filesystem - subversion version"
arch=('i686' 'x86_64')
url="http://hadoop.apache.org"
license=('APACHE')
depends=('jre' 'zlib' 'gzip' 'lzo' 'bzip2')
makedepends=('jdk' 'apache-ant' 'subversion')
optdepends=('kfs')
conflicts=('hadoopb')
install=hadoop.install
source=('progressReporter.patch')
md5sums=('f991dca050cb9bacaa67e062d66b1a76')

_svntrunk=http://svn.apache.org/repos/asf/hadoop/core/trunk
_svnmod=hadoop-svn

build() {

  cd ${srcdir}

  if [ -d ${_svnmod}/.svn ]; then
    (cd ${_svnmod} && svn -R revert .)
    (cd ${_svnmod} && svn -r ${pkgver} up)
  else
    rm -rf ${_svnmod}
    svn co ${_svntrunk} --config-dir ./ -r ${pkgver} ${_svnmod}
  fi

  msg "SVN checkout done or server timeout"

  cd ${srcdir}/${_svnmod} || return 1

  msg "Cleaning..."

  ant clean || return 1

  msg "Patching..."

  patch -Np0 -i ${srcdir}/progressReporter.patch || return 1

  msg "Building..."

  ant -Dcompile.native=true bin-package || return 1

  msg "Installing..."

  mkdir -p ${pkgdir}/usr/share
  mkdir -p ${pkgdir}/etc/hadoop

  cd ${srcdir}/${_svnmod}/build || return 1

  mv hadoop-${_devver} ${pkgdir}/usr/share/hadoop
  mv ${pkgdir}/usr/share/hadoop/conf ${pkgdir}/etc/hadoop/default

  cd ${pkgdir}/etc/hadoop/default || return 1

  msg "Configuring..."

  # Set Java home:
  echo 'export JAVA_HOME=/opt/java/jre' >> hadoop-env.sh

  # Set directories:
  echo 'export HADOOP_LOG_DIR="/var/log/hadoop"' >> hadoop-env.sh
  echo 'export HADOOP_PID_DIR="/var/run"' >> hadoop-env.sh

  # Disable IPv6 (comment out for IPv6 support):
  sed -i 's|_OPTS="-D|_OPTS="-Djava.net.preferIPv4Stack=true -D|' hadoop-env.sh

  cd ${pkgdir}/usr/share/hadoop || return 1

  sed -i 's#^export HADOOP_HOME=`dirname "$this"`/..#export HADOOP_HOME="/usr/share/hadoop"\nexport HADOOP_CONF_DIR="/etc/hadoop"#' bin/hadoop-config.sh

  if [ "$CARCH" = "i686" ]; then
    cd lib/native/Linux-i386-32
  fi

  if [ "$CARCH" = "x86_64" ]; then
    cd lib/native/Linux-amd64-64
  fi

  # Create some links, so Hadoop's KFS jar could access KFS libraries properly
  # (it is still fine if KFS is not installed)

  msg "Creating KFS links..."

  for lib in libkfsClient libkfsCommon libkfsEmulator libkfsIO libkfsMeta; do
    for ext in a so; do
      ln -s /usr/lib/${lib}.${ext}
    done
  done

  ln -s /usr/lib/libkfs_access.so
}
