# Mantainer: Ivan de Jesús Pompa García <ivan.pompa@gmx.com>
# Contributor: Paolo Stivanin <admin@polslinux.it>
#              Tai Chi Minh Ralph Eastwood <tcmreastwood@gmail.com>
#              Hexchain Tong <i@hexchain.org>

pkgname=('psmouse-alps-driver')
_patchver='1.3'
_dkmsname='psmouse-alps'
pkgver=${_patchver}
pkgrel=4
epoch=2
pkgdesc='psmouse kernel module with support for alpsv1-alpsv6 touchpad'
arch=('i686' 'x86_64')
url='http://www.dahetral.com/'
license=('GPL2')
depends=('dkms')
makedepends=('linux-headers')
conflicts=('psmouse-alps')
provides=('psmouse-alps')
options=('!strip')
install=psmouse.install
source=(
    'http://www.dahetral.com/public-download/alps-psmouse-dlkm-for-3-2-and-3-5/at_download/file'
)

md5sums=(
    'c826dd5b17ea20e521dc5fef1ab0bac7'
)

package() {
    mkdir -p ${pkgdir}/usr/src/${_dkmsname}-${_patchver}/src
    cp -RL ${srcdir}/usr/src/${_dkmsname}-${_patchver}/src/* ${pkgdir}/usr/src/${_dkmsname}-${_patchver}/src
    cp -RL ${srcdir}/usr/src/${_dkmsname}-${_patchver}/dkms.conf ${pkgdir}/usr/src/${_dkmsname}-${_patchver}
}
