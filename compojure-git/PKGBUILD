# Maintainer: Andreas B. Wagner <AndreasBWagner@pointfree.net>
# Contributor: chylli (lchangying at gmail dot com)
pkgname=compojure-git
pkgver=20111005
pkgrel=3
pkgdesc="Concise web framework for Clojure"
arch=(i686 x86_64)
url="http://github.com/weavejester/compojure"
license=("CPL" "EPL")
depends=('java-environment' 'clojure' 'leiningen')
makedepends=('apache-ant' 'git')
provides=('compojure')
options=()
source=()
md5sums=()

_gitroot=git://github.com/weavejester/compojure.git
_gitname=compojure

build() {
  cd ${srcdir}

  msg "Connecting to github.com GIT server..."
  if [ -d ${_gitname} ]; then
    (cd ${_gitname} && git pull origin)
  else
    git clone ${_gitroot}
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting ant build process..."

  rm -rf ${_gitname}-build
  git clone ${_gitname} ${_gitname}-build
  cd ${_gitname}-build
  pwd

  lein deps
  lein jar
}
package() {
  cd ${_gitname}-build
  mkdir -p ${pkgdir}/usr/share/clojure
  install -m 644 -D {compojure*jar,lib/*jar} ${pkgdir}/usr/share/clojure/
}
