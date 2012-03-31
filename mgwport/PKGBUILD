pkgname=mgwport
pkgver=0.10.6
pkgrel=1
pkgdesc="A revolutionary new method for building and maintaining packages for the MinGW and MSYS platforms"
arch=(any)
url="http://mingw.org/"
license=("BSD GPL")
depends=('autoconf>=2.5' 'automake>=1.11' gawk groff help2man sed)
makedepends=(xz)
source=("http://downloads.sourceforge.net/mingw/mgwport-$pkgver-1-mingw32-src.tar.lzma")
md5sums=('eeed434f4292ffc094e876b91905125f')

build() {
  cd "${srcdir}/mgwport-$pkgver-1-mingw32-src"
  xz -dfv "mgwport-$pkgver.tar.xz"
  tar -xvf "mgwport-$pkgver.tar"
  cd "mgwport-$pkgver"
  ./configure \
    --prefix=/usr
  make
}

package()
{
  cd "${srcdir}/mgwport-$pkgver-1-mingw32-src/mgwport-$pkgver"
  make DESTDIR=$pkgdir install
}