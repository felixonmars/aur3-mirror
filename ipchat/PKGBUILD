# Maintainer: Otto Sabart - Seberm <seberm[at]gmail[dot]com>

pkgname=ipchat
pkgver=0.5
pkgrel=2
pkgdesc="Peer to peer, serverless, easy to use chat program"
url="http://www.nongnu.org/ipchat"
arch=('i686' 'x86_64')
license=('GPLv3')
depends=('glibc' 'libgcrypt')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
#install=''
source=(http://download.savannah.gnu.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.gz ui_common.h.patch)

md5sums=('6b26edffaa37d3bf8fc74f4ef2b74544'
         '9401f1671495f06eda57cd0755e880c9')

build() {
	
	cd "${srcdir}/${pkgname}-${pkgver}"	

    # Patch it first
    echo "Patching ..."
    patch -p1 --directory=src/ < $srcdir/ui_common.h.patch

    ./configure
    make || return 1
}

package() {
	
	cd ${srcdir}/${pkgname}-${pkgver}
	make DESTDIR="${pkgdir}" install || return 1
}
