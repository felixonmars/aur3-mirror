# Maintainer: Isaac Dupree <antispam@idupree.com>

pkgname=sassc
pkgver=3.2.4
pkgrel=1
pkgdesc="C implementation of Sass CSS preprocessor."
arch=('i686' 'x86_64')
url="http://libsass.org/"
license=('MIT')
depends=('libsass')
source=(https://github.com/hcatlin/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('26218c234bb020a9b5a3e6ce7c6d4620dd351ce621f3b5895a5517e7d2764d4f')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
