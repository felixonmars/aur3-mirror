# Contributor: Borislav Gerassimov (slimmer) <borislavba (at) gmail.com>
pkgname=qutim-plugin-weather
pkgver=0.1
pkgrel=2
pkgdesc="Weather plugin for Qutim"
arch=('i686' 'x86_64')
url="http://qutim.org"
license=('GPL')
makedepends=('make')
depends=('qutim')
source=("http://62.109.3.250/sites/default/files/weather-$pkgver.tar")
md5sums=('e484f9ffa72532bb2c1b2c4fc0cc94b4')

build() {
msg "Building and installing..."
   cd $srcdir/weather
   qmake || return 1
   make || return 1
   install -Dm 644 $srcdir/libweather.so \
                   $pkgdir/usr/lib/qutim/libweather.so || return 1 
}
