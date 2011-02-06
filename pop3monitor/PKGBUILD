# Contributor: Calimero <calimeroteknik@free.fr>
pkgname=pop3monitor
pkgver=0.2
pkgrel=1
pkgdesc="A very simple pop3browser GUI, allowing to see and delete mails on a pop3 server."
arch=('i686' 'x86_64')
url="http://calimeroteknik.free.fr/pop3monitor/"
license=('GPL2')
depends=('zenity' 'pop3browser')
source=(http://calimeroteknik.free.fr/pop3monitor/source/pop3monitor-${pkgver}/pop3monitor
	http://calimeroteknik.free.fr/pop3monitor/source/pop3monitor-${pkgver}/pop3monitor.desktop)
md5sums=('')

build() {
  cd "$srcdir"
  install -D -m644 pop3monitor "$pkgdir"/usr/bin/pop3monitor
  chmod 775 "$pkgdir"/usr/bin/pop3monitor
  install -D -m644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
}
