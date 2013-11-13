# Maintainer: jtts
# Contributor: Christian METZLER <neroth@xeked.com>

pkgname=gnome-shell-extension-yawe-git
pkgver=20131112
pkgrel=1
pkgdesc="Yet another weather extension to display weather information from several cities in GNOME Shell."
arch=(any)
url="https://github.com/jenslody/gnome-shell-extension-weather"
license=(GPL3)
depends=(glib2 gettext pkg-config)
makedepends=(git gnome-common-git autoconf automake intltool)
replaces=(gnome-shell-extension-weather-neroth-git
	  gnome-shell-extension-weather-git)
install='gschemas.install'
source=("$pkgname"::"git+https://github.com/jenslody/gnome-shell-extension-weather#branch=yahoo_weather")
# Note: If you want to use the master branch (which now uses OpenWeatherMap)
#	instead of the yahoo_weather branch (Yahoo! Weather),
#	comment the source line above and uncommont the source line below.
#source=("$pkgname"::"git+https://github.com/jenslody/gnome-shell-extension-weather#branch=master")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR=$pkgdir install
}