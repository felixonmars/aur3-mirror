# Maintainer: Kyle Keen <keenerd@gmail.com>

pkgname=xxxterm-cvs
pkgver=20101227
pkgrel=1
pkgdesc="A minimalists web browser, vi-like while maintaining traditional web browser behavior."
arch=('i686' 'x86_64')
url="http://opensource.conformal.com/wiki/XXXTerm"
license=('custom:ISC')
depends=('libwebkit' 'gtk2' 'libbsd')
conflicts=('xxxterm')
provides=('xxxterm')
makedepends=('cvs' 'openssh')
optdepends=()
source=()
md5sums=()

#_cvsroot="anoncvs@anoncvs.freedaemon.com:/xxxterm"
_cvsroot="anoncvs@opensource.conformal.com:/anoncvs/xxxterm"
_cvsmod="xxxterm"

build() {
  cd "$srcdir"
  # yeah, this is not how you're supposed to do a cvs pkgbuild
  # but the openbsd servers are VERY picky
  export CVS_RSH=ssh

  msg "Connecting to anoncvs.freedaemon.com CVS server...."
  cvs -d $_cvsroot co $_cvsmod
  cd $_cvsmod

  msg "CVS checkout done or server timeout"
  msg "Starting make..."  

  cd linux
  make javascript.h
  make PREFIX="/usr"
  make PREFIX="/usr" DESTDIR="$pkgdir" install
  cd ..
  install -Dm644 xxxterm.conf "$pkgdir"/etc/xxxterm.conf
  cd ../..
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
