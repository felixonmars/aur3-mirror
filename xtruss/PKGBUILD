# Maintainer: Christian Neukirchen <chneukirchen@gmail.com>
pkgname=xtruss
pkgver=9879
pkgrel=1
pkgdesc="an easy-to-use X protocol tracing program"
arch=('i686' 'x86_64')
url="http://www.chiark.greenend.org.uk/~sgtatham/xtruss/"
license=('custom:X11')
depends=('glibc')
source=(http://www.chiark.greenend.org.uk/~sgtatham/xtruss/$pkgname-r$pkgver.tar.gz)
md5sums=('398d251fbbdf49311cd32e128439beba')
sha256sums=('eaa0bdd79e724b6ff2c284e6ff3874d92e01118564da2fd96c00528c5514159d')

build() {
  cd "$srcdir/$pkgname-r$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-r$pkgver"
  make DESTDIR="$pkgdir/" install
  install -D -m644 LICENCE "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

# vim:set ts=2 sw=2 et:
