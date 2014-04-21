# Maintainer: José Neder <jlneder@gmail.com>
# Based on package by Jelle van der Waa <jelle vdwaa nl>.
pkgname=connman-dispatcher-chrony
pkgver=1.0
pkgrel=2
pkgdesc="Dispatcher Script for chrony"
arch=(any)
license=('BSD')
url="http://www.gnome.org/projects/NetworkManager"
depends=('python2-connman-dispatcher' 'chrony')
backup=(etc/connman-dispatcher.d/10-chrony)
changelog=ChangeLog
source=("10-chrony" "connman-dispatcher.service" )
sha256sums=('1fc8e701b7c0dd255541005482e5473875a7d457b5943733241957314ebc97c1' '9e3851a99271c9efe82d0d23e2000fbbcdd6a0809e9ed642afdf5f0eff684d2e')

package() {
  install -Dm700 $srcdir/10-chrony $pkgdir/etc/connman-dispatcher.d/10-chrony
  install -Dm600 $srcdir/connman-dispatcher.service $pkgdir/usr/lib/systemd/system/connman-dispatcher.service
}
