# Maintainer: Aleksander Morgado <aleksander@aleksander.es>
pkgname=mobile-radio-monitor
pkgver=1.0
pkgrel=1
pkgdesc="The Mobile Radio Monitor is a monitor for mobile radio environment parameters."
arch=('i686' 'x86_64')
url="https://aleksander.es"
license=('GPL3')
depends=('libqmi>=1.4' 'gtk3>=3.9.8' 'libsystemd>=147' )
makedepends=('pkgconfig')
source=('https://aleksander.es/software/mobile-radio-monitor-1.0.tar.xz')
md5sums=('3429836b4950143661013308b5552700')

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
