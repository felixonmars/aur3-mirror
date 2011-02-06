# Maintainer: David Trail <napalm10 at g mail dot com>
# The seam vm, used with Alice SML

pkgname=seam
pkgver=1.4
pkgrel=1
pkgdesc="Simple Extensible Abstract Machine"
arch=('i686' 'x86_64')
url="http://www.ps.uni-saarland.de/seam/"
license=('custom') # http://www.ps.uni-saarland.de/alice/download/COPYING
depends=('gcc-libs' 'zlib' 'sh')
source=("http://www.ps.uni-saarland.de/alice/download/sources/seam-$pkgver.tar.gz");

md5sums=('0149b40811d9ce845e9a5da1586d0d1a')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --disable-lightning

  # get rid of type conversion errors.
  sed -e s/u_int/u_long/g -i ./store/*.{cc,hh}
  sed -e s/u_int/u_long/g -i ./*.{cc,hh}

  make || return 1
  make DESTDIR=$pkgdir install || return 1
}

# vim:set ts=2 sw=2 et:
