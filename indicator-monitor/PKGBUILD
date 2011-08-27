# Maintainer: Dominik Mayer <dominik.mayer@gmail.com>
pkgname=indicator-monitor
pkgver=0.1.0
pkgrel=1
pkgdesc="Monitors process activities, and lists heavy CPU, memory or disk consumers."
arch=('i686' 'x86_64')
url="http://code.google.com/p/indicator-monitor/"
license=('GPL')
depends=('libsigc++' 'gtkmm' 'indicator-application' 'libnotify' 'libgtop')
source=(http://indicator-monitor.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('085697ccfaeba8a224a1afb2e149392a')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
