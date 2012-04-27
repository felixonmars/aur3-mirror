# Maintainer : SpepS <dreamspepser at yahoo dot it>
# Contributor: oslik <oslik@mail.ru>

pkgname=u3d
pkgver=1.4.3
pkgrel=1
pkgdesc="Set of libraries to manipulate U3D-formatted data. IDTF to U3D converter"
url="http://sourceforge.net/projects/mathgl/files/U3D%20tools/"
arch=('i686' 'x86_64')
license=('custom:APACHE')
depends=('libpng' 'libjpeg')
options=('!libtool')
source=("http://downloads.sourceforge.net/project/mathgl/U3D%20tools/$pkgname%20$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('c99dc62aba45bd0703ae48610fe73c0b')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # missing string.h
  sed -i '28i#include <string.h>' RTL/Component/Include/IFXAttributes.h

  ./configure --prefix=/usr \
              --enable-static=no
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install

  # license
  install -Dm644 COPYING \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}