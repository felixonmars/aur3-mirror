# Maintainer: Leonardo Dagnino <leodag dot sch at gmail dot com>

pkgname=uksmstat
pkgver=20121015
pkgrel=2
pkgdesc="Simple tool to monitor and control UKSM"
url="https://github.com/pfactum/uksmstat"
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('git')
depends=()
_git="https://github.com/pfactum/uksmstat"

build() {
  {
    git clone ${_git} ${pkgname}
    cd "$srcdir/$pkgname"
    git checkout
  } || _fail="hey"
  if [ ${_fail} == "hey" ]; then
    msg "Something went wrong. Exiting..."
    return 1
  fi
 
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make install DESTDIR="${pkgdir}/"  
  mv ${pkgdir}/usr/local/* ${pkgdir}/usr
  rm -r ${pkgdir}/usr/local
}
