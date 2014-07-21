pkgname=offerings-qt
pkgver=1.4.0
pkgrel=1
pkgdesc="Cthulhu offerings is a peer-to-peer network based digital currency - Qt"
arch=('i686' 'x86_64')
license=('MIT')
url="http://cthulhu.tk/"
makedepends=('git' 'openssl' 'db' 'boost' 'miniupnpc' 'qconf')
md5sums=()

gitroot="https://github.com/thegreatoldone/offerings.git"
gitname="offerings"
gitrev="67bad1c7ad"

build() {
  cd ${srcdir}

  if [[ -d ${gitname} ]] ; then
    cd ${gitname}
    git fetch -q
    git reset -q --hard origin/master
    git checkout -f -q ${gitrev}
  else
    git clone ${gitroot}
    cd ${gitname}
    git checkout -f -q ${gitrev}
  fi

  qmake-qt4
  make
}

package() {
  cd ${srcdir}/offerings

  install -Dm0755 Offerings-qt ${pkgdir}/usr/bin/offerings-qt
  install -Dm644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}
