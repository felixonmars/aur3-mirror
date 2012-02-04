# Contributor: Mark Rosenstand <mark@borkware.net>
pkgname=kvibille
pkgver=0.1
pkgrel=1
pkgdesc="AFS ACL extension for Nautilus."
url="http://www.nada.kth.se/hacks/"
license=""
depends=('gtkmm' 'nautilus')
makedepends=('gettext' 'intltool' 'pkgconfig')
conflicts=('eiciel')
install=
source=(ftp://ftp.nada.kth.se/pub/hacks/kvibille/$pkgname-$pkgver.tar.bz2)
md5sums=('44f796bf64d102a18798cdb6b95b6fa3')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/opt/gnome
  make || return 1
  make DESTDIR=$startdir/pkg install

  # libtool slay
  find $startdir/pkg -name '*.la' -exec rm {} \;
}
