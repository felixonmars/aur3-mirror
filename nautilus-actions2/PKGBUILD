# Maintainer : Ionut Biru <ibiru@archlinux.org>
# Contributor: Roman Kyrylych <roman@archlinux.org>
# Contributor: Tor Krill <tor@krill.nu>
# Contributor: Spyros Stathopoulos <foucault.online@gmail.com>

pkgname=nautilus-actions2
_pkgname=nautilus-actions
pkgver=3.2.2
pkgrel=1
pkgdesc="Configures programs to be launched when files are selected in Nautilus (gtk2 version)"
arch=('i686' 'x86_64')
url="http://gnome.org"
license=('GPL')
depends=('nautilus' 'libgtop' 'desktop-file-utils' 'gconf' 'libsm' 'libunique')
makedepends=('intltool' 'gnome-doc-utils>=0.20.0')
conflicts=('nautilus-actions')
provides=('nautilus-actions')
install=nautilus-actions.install
options=('!libtool')
source=("http://www.nautilus-actions.org/downloads/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('2f2352d9628459a1bc1fe0550eddea97645dfaa2a4381465c87abd8a646089bf  ')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --with-gtk=2
    make
}

package(){
    cd ${srcdir}/${_pkgname}-${pkgver}
    make  GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=${pkgdir} install
    mkdir -p ${pkgdir}/usr/share/gconf/schemas
    gconf-merge-schema ${pkgdir}/usr/share/gconf/schemas/${_pkgname}.schemas --domain nautilus-actions \
        ${pkgdir}/etc/gconf/schemas/*.schemas
    rm -rf ${pkgdir}/etc/gconf/schemas/
}
