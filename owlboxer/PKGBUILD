# Maintainer: Danilo Bargen <gezuru gmail com>
# Patch is taken from http://code.google.com/p/owlboxer/issues/detail?id=1

pkgname=owlboxer
pkgver=1.02
pkgrel=1
pkgdesc="Owlboxer is editor for tesseract box files written using Qt."
arch=(i686 x86_64)
url="http://code.google.com/p/owlboxer/"
license=('GPL')
depends=('qt')
makedepends=('make')
optdepends=('tesseract')
source=('http://owlboxer.googlecode.com/files/owlboxer-1.02.tar.gz'
        'owlboxer.compile.patch')
md5sums=('bb23a7b14240e301edfdd4a666540147'
         'd27e784b2aaa8728240d3231535dc0f7')

build() {
  cd "$srcdir/$pkgname"
  patch -p1 < ../owlboxer.compile.patch
  qmake OwlBoxer.pro
  make
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p "$pkgdir/usr/bin/"
  install -m 755 -p OwlBoxer "$pkgdir/usr/bin/"
}

# vim:set ts=2 sw=2 et:
