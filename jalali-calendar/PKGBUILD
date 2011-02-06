# Maintainer: Hamed Ramezanian <iceage2098 at gmail dot com>
# Contributor: Mohammad Razeghi

pkgname=jalali-calendar
pkgver=1.7.1
pkgrel=1
pkgdesc="Jalali Calender Applet"
arch=(any)
url="https://launchpad.net/jalali-calendar"
license=('GPL')
source=(http://launchpad.net/jalali-calendar/trunk/${pkgver}/+download/jalali-calendar-${pkgver}.tar.bz2)
md5sums=('b10a8783fb59435625f38ca74efc8c8d')

build (){
  cd "$srcdir/$pkgname-$pkgver"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
