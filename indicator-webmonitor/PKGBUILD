# Maintainer: mw4rf <mw4rf@sent.at>
pkgname=indicator-webmonitor
pkgver=0.1
pkgrel=1
pkgdesc="Monitor web servers. App Indicator for Ubuntu Unity."
arch=('i686' 'x86_64')
url="http://www.valhalla.fr/"
license=('GPL')
depends=('python>=3' 'libindicator3>=0.3.0' 'libnotify>=0.7.1' 'libappindicator3')
makedepends=()
options=()
install=$pkgname.install
source=(http://asgard.valhalla.fr/indicator-webmonitor/indicator-webmonitor-$pkgver.tar.gz)
md5sums=('d49aa971db7b9d6ce7330885b4ec8bd9')

build() {
    cd "$pkgname-$pkgver"
}

package() {
  cd "$pkgname-$pkgver"
  mkdir -p $pkgdir/opt/indicator-webmonitor
  cp * $pkgdir/opt/indicator-webmonitor
  mkdir -p $pkgdir/usr/share/applications/
  cp indicator-webmonitor.desktop $pkgdir/usr/share/applications/
  chmod +x $pkgdir/usr/share/applications/indicator-webmonitor.desktop
}
