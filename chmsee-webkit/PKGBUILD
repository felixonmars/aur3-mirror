# chmsee pathced to work with webkit
# contributor: hadzhimurad ustarkhan - hmurad dot ust at gmail dot com
# Contributor : giacomogiorgianni@gmail.com

pkgname=chmsee-webkit
pkgbase=chmsee
pkgver=1.3.1.1
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="A chm (MS HTML help file format) viewer based on webkit."
url="http://chmsee.googlecode.com/"
license="GPL"
depends=('gtk2' 'libglade' 'chmlib' 'libwebkit')
makedepends=('intltool' 'cmake')
provides=('chmsee')
conflicts=('chmsee')
source=(https://chmsee.googlecode.com/files/$pkgbase-$pkgver.tar.gz
        $pkgbase-$pkgver-webkit.patch)
md5sums=('7c226e6f518284a040ad3b9433d5e218'
         'ff214166a9838755f1155f1b0cd39978')

build() {

  cd ${srcdir}/$pkgbase-$pkgver

  patch -Np1 -i "$srcdir/$pkgbase-$pkgver-webkit.patch"

  mkdir build
  cd build

  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd ${srcdir}/$pkgbase-$pkgver/build

  make DESTDIR="$pkgdir" install
}
