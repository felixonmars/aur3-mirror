# Contributor: katanasov <pranayama111@gmail.com>
# Maintainer: katanasov
pkgname=evolution-on
pkgver=20141804
pkgrel=1
pkgdesc="Plugin to put evolution in system tray."
arch=('i686' 'x86_64')
url="https://github.com/KostadinAtanasov/evolution-on"
license=('GPL')
groups=('office')
depends=('evolution>=2.30' 'gconf' 'libnotify')
makedepends=('git' 'autoconf>=2.53' 'automake>=1.8''libtool>=1.4.3' 'glib2>=2.2.0' 'pkgconfig>=0.14.0' 'intltool>=0.25' 'gnome-common>=2.3.0')
provides=('evolution-on')
conflicts=('evolution-tray' 'evolution-tray-arch')
replaces=('evolution-tray' 'evolution-tray-arch')
install=evolution-on-install
source=($pkgname-$pkgver.zip::https://github.com/KostadinAtanasov/evolution-on/archive/0.1.1.zip)
sha1sums=('d65a2bfac67af054a2dea37decec3880d25bcc8a')

upstreamname="evolution-on"
upstreamver="0.1.1"

package() {
	cd "${srcdir}/${upstreamname}-${upstreamver}"
	./autogen.sh --prefix=/usr
	make
	make DESTDIR="$pkgdir" install
}

