# Maintainer: Isaac Dupree <antispam@idupree.com>

pkgname=libsass
pkgver=3.2.4
pkgrel=1
pkgdesc="C implementation of Sass CSS preprocessor (library)."
arch=('i686' 'x86_64')
url="http://libsass.org/"
license=('MIT')
source=(https://github.com/hcatlin/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('10c50202f8edfb829609a66a3add24076d84b8e3d0904c613c6947304f2600ed')

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
