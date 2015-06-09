pkgname=namecoind
pkgver=0.3.7.2
pkgrel=2
pkgdesc="Headless namecoin daemon"
arch=('i686' 'x86_64')
license=('MIT')
url="https://github.com/namecoinq/namecoinq"
makedepends=('openssl' 'db' 'boost>=1.40' 'miniupnpc' 'git')
md5sums=()

gitroot="https://github.com/namecoinq/namecoinq.git"
gitname="namecoinq"
gitrev="5b00e68860"

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

  cd src

  sed -i '24s|Bstatic|Bdynamic|' Makefile
  make || return 1
}

package() {
  cd ${srcdir}/namecoinq/src

  install -Dm0755 namecoind ${pkgdir}/usr/bin/namecoind
  install -Dm644 ../COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}
