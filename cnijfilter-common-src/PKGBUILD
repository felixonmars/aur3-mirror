# Contributor: Vamp898 <vamp898@web.de>
pkgname=cnijfilter-common-src
pkgver=3.00
pkgrel=1
pkgdesc="Canon Driver for ip1900/ip3600/ip4600 mp190/240/540/630"
arch=( 'i686' 'x86_64' )
url="http://support-my.canon-asia.com/contents/MY/EN/0100160603.html"
license=('GPL')
depends=()
makedepends=()
provides=()
source=( http://ignaz.uuuq.com/cnijfilter-common-3.00-1.tar.gz )
md5sums=('b4c3dab3c491fbe3f9dc830dae401a45')

build() {
  cd "$srcdir/cnijfilter-common-$pkgver"

  cd libs
  ./autogen.sh --prefix=/usr
  make -j1 || return 1
  make DESTDIR=$pkgdir install || return 1
  cd ../backend
  ./autogen.sh --prefix=/usr
  make -j1 || return 1
  make DESTDIR=$pkgdir install || return 1
  cd ../pstocanonij
  ./autogen.sh --prefix=/usr
  make -j1 || return 1
  make DESTDIR=$pkgdir install || return 1
  cd ../ppd
  mkdir -p $pkgdir/usr/share/cups/model/
  mv *.ppd $pkgdir/usr/share/cups/model/
}
