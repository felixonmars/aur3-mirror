pkgname=freecca
pkgver=1.0.4
pkgrel=2
pkgdesc="Cisco NAC Client for Linux"
arch=('x86_64' 'i686')
url="http://code.google.com/p/freecca/"
license=('GPL3')
depends=( 'gtk-sharp-2' 'gconf-sharp' 'ndesk-dbus-glib' 'gnome-keyring-sharp' 'notify-sharp' )
optdepends=( 'networkmanager' )
source=("http://freecca.googlecode.com/files/freecca-${pkgver}.tar.gz")
sha1sums=('27b91d08411fb7955792046e0cf56a118117cebc')
install=(freecca.install)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"  

  ./configure --prefix=/usr --sysconfdir=/etc --enable-notifyicon

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  install -Dm644 data/freecca.schemas "${pkgdir}/usr/share/gconf/schemas/freecca.schemas"
}
