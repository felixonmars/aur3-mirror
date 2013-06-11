pkgname=gnome-shell-extension-sensors
pkgver=v1.3.21.g9571365
pkgrel=1
pkgdesc="Gnome Shell extension for displaying CPU temperature, hard disk temperature, voltage and CPU fan RPM in GNOME Shell"
arch=('any')
url="https://github.com/xtranophilist/gnome-shell-extension-sensors.git"
license=('GPL')
depends=('gnome-shell' 'lm_sensors')
makedepends=('gnome-common' 'intltool')
source=("git://github.com/xtranophilist/gnome-shell-extension-sensors.git")
sha1sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  ./autogen.sh
  ./configure --prefix=/usr
  make || return 1
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install
}

pkgver() {
  cd $pkgname
  git describe --always | sed 's|-|.|g'
}
