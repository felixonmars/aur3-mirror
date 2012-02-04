# Contributor: Martin Stolpe <martin.stople [at] uni-ulm dot org>

pkgname=connman-gnome
pkgver=0.5
pkgrel=3
pkgdesc="Wireless LAN network manager"
url="http://moblin.org/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('dbus-glib' 'gtk2' 'hicolor-icon-theme')
optdepends=('cairo-lcd')
makedepends=('git')
install='connman-gnome.install'
source=("http://www.kernel.org/pub/linux/network/connman/${pkgname}-${pkgver}.tar.bz2")
md5sums=('fcc3cabaab36f7f35538e8a4fb7ffbe2')


build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
} 
 
