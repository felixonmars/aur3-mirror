# Maintainer: Xavier D. <magicrhesus@ouranos.be>
# Contributor: Valere Monseur <valere.monseur@ymail.com>

pkgname=eid-mw
pkgver=4.0.4
pkgrel=1
pkgdesc="The eID middleware for the Belgian eID"
url="http://eid.belgium.be/fr/utiliser_votre_eid/installer_le_logiciel_eid/linux/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('pcsclite' 'gtk2')
optdepends=('firefox: extension for Belgian eid')
makedepends=('autoconf' 'automake' 'java-runtime')
source=(http://eid.belgium.be/fr/binaries/${pkgname}-${pkgver}-1253_tcm226-178475.tgz)
md5sums=('485eb2ebafd44efaf0b487122485ecf8')
options=('!libtool')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure --prefix=/usr --libexecdir=/usr/bin
    make
}

package() {
    cd ${pkgname}-${pkgver}
    make DESTDIR=${pkgdir} install
}
