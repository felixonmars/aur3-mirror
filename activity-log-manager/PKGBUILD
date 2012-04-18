# Maintainer: Ner0

pkgname=activity-log-manager
pkgver=0.9.4
pkgrel=1
pkgdesc="A graphical user interface which lets you easily control what gets logged by Zeitgeist."
url="https://launchpad.net/activity-log-manager"
license=('GPL2')
arch=('i686' 'x86_64')
depends=('gtk3' 'hicolor-icon-theme' 'libgee' 'libzeitgeist' 'xdg-utils')
makedepends=('intltool' 'pkg-config')
backup=('etc/dbus-1/system.d/com.ubuntu.WhoopsiePreferences.conf')
install=$pkgname.install
source=("${url}/${pkgver%.*}/${pkgver}/+download/${pkgname}-$pkgver.tar.gz")
md5sums=('cf85aecdaa6c0188a53d659709e1f8cd')

build() {
  cd $pkgname-$pkgver

  # --docdir= doesn't do anything
  sed -i 's|almdocdir =.*|almdocdir = ${prefix}/share/doc/activity-log-manager|' Makefile.{am,in}

  ./configure --prefix=/usr --datadir=/usr/share --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
