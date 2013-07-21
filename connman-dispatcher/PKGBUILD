# Maintainer : a-sk <askurihin at gmail dot com>

pkgname=connman-dispatcher
pkgver=0.0.1
pkgrel=7
pkgdesc="Call scripts on network changes"
arch=('i686' 'x86_64')
url="http://github.com/a-sk/connman-dispatcher"
license=('MIT')
depends=('python2' 'python2-connman-dispatcher')
source=("connman-dispatcher.service")
md5sums=('fdbb2a957ba1f1e8ef496cd32b59085d')

package() {
  cd "$srcdir"
  install -m755 -d ${pkgdir}/etc/connman-dispatcher
  install -Dm644 "${srcdir}/connman-dispatcher.service" "${pkgdir}/usr/lib/systemd/system/connman-dispatcher.service"
}
