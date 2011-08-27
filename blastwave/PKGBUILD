# Contributor: Marc St-Laurent <mstlaurent@canada.com>
pkgname=blastwave
pkgver=0.1.1
_pkgdir=0-1-1
pkgrel=4
pkgdesc="A GTK+/C based GUI client for the XMMS2 Music Multiplexing System."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/blastwave"
license=('GPL')
depends=('xmms2' 'gtk2')
makedepends=('intltool' 'pkgconfig')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz
        blastwave.desktop)
md5sums=('9be6fa4e8a478bfa7429b302a98bc10f'
         'b11e0e6865e9778ca0009e6b571243c0')

build() {
  cd $startdir/src/$pkgname-$_pkgdir

  ./autogen.sh
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$startdir/pkg" install
  install -D -m644 $startdir/src/blastwave.desktop $startdir/pkg/usr/share/applications/blastwave.desktop
}

