# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname='octopi-notifier-qt4'
pkgver=0.7.0
pkgrel=3
arch=('i686' 'x86_64')
pkgdesc="Notifier for Octopi built on qt4"
url="https://github.com/aarnt/octopi"
license=('GPL2')
depends=('qt4' 'octopi' 'libnotify')
optdepends=('xfce4-notifyd: for notifications in XFCE')
install=octopi.install
conflicts='octopi-notifier'
provides='octopi-notifier'
replaces='octopi-notifier'
source=("https://github.com/aarnt/octopi/archive/v${pkgver}.tar.gz")
sha256sums=('03d15458ebe482e5a9a00e7a3db5676a53886c754b13a7c56e36d75b73f2d496')

build() {
  _cpucount=$(grep -c processor /proc/cpuinfo 2>/dev/null)
  _jc=$((${_cpucount:-1}))
   
  cd "${srcdir}/octopi-${pkgver}"

  cd "${srcdir}/octopi-${pkgver}/notifier/octopi-notifier"
  msg "Building octopi-notifier..."
  qmake-qt4 octopi-notifier.pro
  make -j $jc
}

package() {
  pkgdesc="Notifier for Octopi built on qt4"

  #Octopi-notifier file
  install -D -m755 "${srcdir}/octopi-${pkgver}/notifier/bin/octopi-notifier" "${pkgdir}/usr/bin/octopi-notifier"
  install -D -m644 "${srcdir}/octopi-${pkgver}/octopi-notifier.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -D -m644 "${srcdir}/octopi-${pkgver}/octopi-notifier.desktop" "${pkgdir}/etc/xdg/autostart/octopi-notifier.desktop"
}

# vim: set ts=2 sw=2 ft=sh noet:
