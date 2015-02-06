# Maintainer: Micael Capitão <mjpcapitao@gmail.com>
pkgname=cartao-cidadao
pkgver=287
pkgrel=1
pkgdesc="Portuguese Citizen Card Application. Repackaged from Fedora 16 SVN version's package."
arch=('x86_64')
url="http://www.cartaodecidadao.pt"
license=('custom')
depends=('qt4>=4.8.0' 'libpng12' 'pcsclite>=1.5.0' 'openssl>=1.0' 'ccid' 'acsccid>=1.0.3' 'xerces-c')
makedepends=('rpmextract')
_downloadurl="http://svn.gov.pt/projects/ccidadao/repository/middleware-offline/tags/builds/lastversion"
packagename="pteid-mw_fedora17_x86_64.rpm"
source=("${_downloadurl}/${packagename}")
md5sums=('71ae92bd4a0595f04485de154e8c1d8f')
sha1sums=('9a36db90e76838e7d1d03d8eed9b67194fdcd07f')

build() {
    rm -rf "${srcdir}/${pkgname}-${pkgver}"
    mkdir "${srcdir}/${pkgname}-${pkgver}"
    cd "${srcdir}/${pkgname}-${pkgver}" || return 1
    rpmextract.sh ../"${packagename}"
    find . -name .svn | xargs rm -fr
    mkdir -p etc/ld.so.conf.d
    echo "/usr/local/lib" >> etc/ld.so.conf.d/pteidgui.conf
    mkdir -p usr/lib || return 1
    cd usr/lib || return 1
    ln -s /usr/lib/libcrypto.so.1.0.0 libcrypto.so.10
    ln -s /usr/lib/libssl.so.1.0.0 libssl.so.10
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}" || return 1
    cp -r * ${pkgdir} || return 1
}
