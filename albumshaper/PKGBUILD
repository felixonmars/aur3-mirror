# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor : J. Santiago Hirschfeld <jsantiagoh@yahoo.com.ar>

pkgname=albumshaper
pkgver=2.1
pkgrel=2
pkgdesc="An application for organizing, editing and sharing your digital photos"
arch=('i686' 'x86_64')
url="http://albumshaper.sourceforge.net/"
license=('GPL')
depends=('qt3' 'libxslt')
source=(http://downloads.sourceforge.net/$pkgname/${pkgname}_$pkgver.tar.bz2
        $pkgname.patch)
md5sums=('242c260c50fd774f2301dba66deb668b'
         'b9c84adea8c72a0706ac84db2ef0a70c')

build() {
  cd "$srcdir"/${pkgname}_${pkgver}_src
  # we need Qt3
  . /etc/profile.d/qt3.sh || return 1
  export PATH="$QTDIR/bin:$PATH"
  # make
  patch -Np0 -i ../$pkgname.patch || return 1
  qmake || return 1
  make || return 1
  # install
  sed -i 's,/usr/bin/AlbumShaper,$(INSTALL_ROOT)/usr/bin/albumshaper,' Makefile
  make INSTALL_ROOT="$pkgdir" install || return 1
}
