# Maintainer: Moez Bouhlel <bmoez.j@gmail.com>

_pkgname=nodogsplash
pkgname=$_pkgname-git
pkgver=0.9_beta9.9.9
pkgrel=1
pkgdesc="Nodogsplash offers a simple way to provide restricted access to an internet connection"
arch=('i686' 'x86_64')
license=('GPL')
url="https://github.com/nodogsplash/nodogsplash"
depends=('iproute2' 'iptables')
conflicts=("$_pkgname")
source=("git+https://github.com/$_pkgname/${_pkgname}.git")
md5sums=('SKIP')
backup=('etc/nodogsplash/nodogsplash.conf'
  'etc/nodogsplash/htdocs/'{images/splash.jpg,splash.html,infoskel.html})

build() {
  cd "$_pkgname"
  make
}

package() {
  make -C "$_pkgname" "DESTDIR=$pkgdir" install
}
