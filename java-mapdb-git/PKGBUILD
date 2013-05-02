# Maintainer: Chen Tong <blovemaple2010@gmail.com>

pkgname=java-mapdb-git
pkgver=20130502
pkgrel=1
pkgdesc='A Java library (formerly JDBM4) providing concurrent TreeMap and HashMap backed by disk storage, which is a fast, scalable and easy to use embedded Java database. - Git vertion'
arch=('i686' 'x86_64')
url='http://www.mapdb.org/'
license=('APACHE')
makedepends=('git' 'maven')
depends=('java-runtime-headless')
provides=('java-mapdb')
conflicts=('java-mapdb')

_gitroot='git://github.com/jankotek/MapDB.git'
_gitname='MapDB'

build() {
  cd "${srcdir}"
  msg 'Connecting to GIT server....'

  if [ -d "${_gitname}" ] ; then
    cd "${_gitname}" && git pull origin
    msg 'The local files are updated.'
  else
    git clone "${_gitroot}" "${_gitname}"
  fi

  msg 'GIT checkout done or server timeout'
  msg 'Starting build...'

  cd "${srcdir}/${_gitname}"
  mvn install
}

package() {
  cd "${srcdir}/${_gitname}/target"
  _version=`ls|grep -Po '(?<=mapdb-).*(?=-test-sources.jar)'`
  mkdir -p $pkgdir/usr/share/java
  install -D -m644 \
    mapdb-${_version}.jar mapdb-${_version}-sources.jar $pkgdir/usr/share/java/mapdb/
  ln -s mapdb-${_version}.jar $pkgdir/usr/share/java/mapdb/mapdb.jar
  ln -s mapdb-${_version}-sources.jar $pkgdir/usr/share/java/mapdb/mapdb-sources.jar
}
