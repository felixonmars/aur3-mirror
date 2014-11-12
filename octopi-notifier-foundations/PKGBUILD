# Maintainer: Jameson Pugh <imntreal@gmail.com>
# Contributor: Filip Brcic <brcha@gna.org>

pkgname=octopi-notifier-foundations
pkgver=0.5.0
pkgrel=1
pkgdesc="Notifier for Octopi"
arch=('i686' 'x86_64')
url="https://github.com/aarnt/octopi"
license=('GPL2')
install=$pkgname.install
makedepends=('automoc4')
depends=('octopi' 'libnotify' 'knotifications' 'qt5-base')
optdepends=('xfce4-notifyd: for notifications in XFCE')
conflicts=('octopi-notifier')
replaces=('octopi-notifier')
provides=('octopi-notifier')
source=("https://github.com/aarnt/octopi/archive/v${pkgver}.tar.gz")
md5sums=('07c5d62182ee8cb2f62313b28177ab6a')

build() {
  _cpucount=$(grep -c processor /proc/cpuinfo 2>/dev/null)
  _jc=$((${_cpucount:-1}))

  cd "$srcdir/octopi-$pkgver/notifier/octopi-notifier"
  qmake-qt5 octopi-notifier.pro 'DEFINES+=KSTATUS'
  make -j $jc
}

package() {
  cd "$srcdir/octopi-$pkgver"
 
   install -D -m755 notifier/bin/octopi-notifier ${pkgdir}/usr/bin/octopi-notifier
   install -D -m644 octopi-notifier.desktop ${pkgdir}/etc/xdg/autostart/octopi-notifier.desktop
}

# vim: set ts=2 sw=2 ft=sh noet:
