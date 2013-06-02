# Maintainer: Alexander De Sousa <<archaur.xandy21@spamgourmet.com>>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Paulo Freire <paulofreire gmail com>

pkgname=kccmp
pkgver=0.3
pkgrel=2
pkgdesc="A simple tool for comparing two Linux kernel .config files."
arch=('i686' 'x86_64')
url="http://stoopidsimple.com/kccmp/"
license=('GPL2')
depends=('qt4' 'boost')
source=(http://stoopidsimple.com/files/$pkgname-$pkgver.tar.gz
        release.patch)
md5sums=('4b2ed44101dbb53228cf7766580d44f1'
         '5c3e8a8817fe96ab4abc4ce8c658380d')
sha1sums=('b030b8af2573a32f046a50a9f59d75320203d63a'
          '83265ebbde9c67fe0418249a3d2182cf40aa3bba')

build() {
  cd $srcdir/$pkgname-$pkgver
  msg2 "Setting release configuration..."
  patch -Nsp1 -i ../release.patch
  msg2 "Building..."
  qmake-qt4
  make -s CXXFLAGS="$CXXFLAGS"
}

package() {
  cd $srcdir/$pkgname-$pkgver
  install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
}

# vim: set ft=sh ts=2 sw=2 et:
