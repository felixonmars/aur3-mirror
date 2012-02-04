pkgname=claws-mail-notification
pkgver=0.27
pkgrel=1
pkgdesc="claws-mail plugin for notifications"
arch=('i686' 'x86_64')
url="http://www.claws-mail.org/plugin.php?plugin=notification"
license=('GPL')
groups=(network)
depends=('claws-mail')
makedepends=('gcc' 'claws-mail')
source=(http://www.claws-mail.org/downloads/plugins/notification_plugin-$pkgver.tar.gz)
md5sums=('aaf299942d3a4c7044f11bc0d65dfbdc')
build() {
  cd "${srcdir}/notification_plugin-${pkgver}"

  ./configure
  make || return 1
  make DESTDIR="$pkgdir" install
}
