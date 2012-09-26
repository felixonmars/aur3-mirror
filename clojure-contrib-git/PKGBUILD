# Maintainer: Andreas B. Wagner <AndreasBWagner@pointfree.net>
# Maintainer: Chris O'Donnell <christopher dot p dot odonnell at gmail dot com>
# Contributor: Sam May <sam.m4y@gmail.com>
pkgname=clojure-contrib-git
pkgver=20120926
pkgrel=2
pkgdesc="User contributions for the Clojure programming language."
arch=('i686' 'x86_64')
url="http://www.clojure.org"
license=("EPL")
depends=('java-environment')
makedepends=('maven' 'git')
provides=('clojure-contrib')
conflicts=('clojure-contrib')

_gitroot=git://github.com/clojure/clojure-contrib.git
_gitname=clojure-contrib

build() {
  cd ${srcdir}

  msg "Connecting to github.com GIT server..."
  if [ -d ${_gitname} ]; then
    (cd ${_gitname} && git pull origin)
  else
    git clone ${_gitroot}
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting maven build process..."
  
  rm -rf ${_gitname}-build
  git clone ${_gitname} ${_gitname}-build
  cd ${_gitname}-build

  mvn package || return 1
}
  
package() {
  mkdir -p ${pkgdir}/usr/share/clojure
  #install -m 644 -D ${srcdir}/${_gitname}-build/target/clojure-contrib-1.2.0-SNAPSHOT.jar ${pkgdir}/usr/share/clojure/
  install -m 644 -D ${srcdir}/${_gitname}-build/modules/standalone/target/standalone-1.3.0-SNAPSHOT.jar ${pkgdir}/usr/share/clojure/
}
