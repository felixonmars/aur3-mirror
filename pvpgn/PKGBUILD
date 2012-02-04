# Maintainer: Jonathan Vasquez <jvasquez1011@gmail.com>

pkgname=pvpgn
pkgver=1.8.5
pkgrel=1
pkgdesc="A bnetd based gaming network server emulation project"
arch=('i686' 'x86_64')
url="http://pvpgn.berlios.de/"
license=('GPL')
#depends=('mysql') # Uncomment for MySQL support
#depends=('postgresql') # Uncomment for PostgreSQL support
optdepends=('mysql: Recompile with this enabled in PKGBUILD for MySQL support'
            'postgresql: Recompile with this enabled in PKGBUILD for PostgreSQL support')
conflicts=('pvpgn' 'pvpgn-server')
source=(http://download.berlios.de/pvpgn/${pkgname}-${pkgver}.tar.bz2)
md5sums=('0a8353c26f8af0272208664a3ce0f830')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}/src"

  # Without MySQL Support
    ./configure --prefix=/usr \
        --sysconfdir=/etc/pvpgn \
        --localstatedir=/var/games/pvpgn \
        --mandir=/usr/share/man

  # With MySQL Support
    #./configure --prefix=/usr \
        #--sysconfdir=/etc/pvpgn \
        #--localstatedir=/var/games/pvpgn \
        #--mandir=/usr/share/man \
        #--with-mysql

  # With PostgreSQL Support
    #./configure --prefix=/usr \
        #--sysconfdir=/etc/pvpgn \
        #--localstatedir=/var/games/pvpgn \
        #--mandir=/usr/share/man \
        #--with-pgsql

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/src"

  make DESTDIR="${pkgdir}" install

  # Fix /var/games and /var/games/pvpgn  permissions from 755 to 775
  chmod 775 ${pkgdir}/var/games
  chmod -R 775 ${pkgdir}/var/games/pvpgn
}
