# Contributor: Loui Chang
# Contributor: Patrick Leslie Polzer <leslie.polzer@gmx.net>
# Contributor: simo <simo@archlinux.org>
pkgname=ptabtools
pkgver=0.5.0
pkgrel=1
pkgdesc="Tools to convert PowerTab files to various formats."
url="http://samba.org/~jelmer/ptabtools/"
license=("GPL3")
arch=('i686' 'x86_64')
depends=('popt' 'libxslt')
source=(http://samba.org/~jelmer/ptabtools/ptabtools-$pkgver.tar.gz Fix-build.patch)

build() {
  cd $srcdir/$pkgname-$pkgver
  patch -p0 < ../Fix-build.patch
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir install
  #mkdir -p $startdir/pkg/usr/bin \
  #      $startdir/pkg/usr/share/man/man1 \
  #      $startdir/pkg/usr/lib/pkgconfig \
  #      $startdir/pkg/usr/include
  #make DESTDIR=$startdir/pkg prefix=/usr install
}
md5sums=('40c1d35caa86be138212d7524baf4943'
         'ec6ab6c58eb54b050a6fff655c62ac1f')
