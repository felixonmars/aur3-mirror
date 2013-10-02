# Contributor MCMic <mcmic@free.fr>

pkgname=wagic-svn
pkgver=0.17
pkgrel=4
pkgdesc="Wagic is an internationally acclaimed open source Trading Card Game simulation, made by card games fans and backed up by a large community of players and modders."
arch=('i686' 'x86_64')
url="http://wololo.net/wagic/download/"
license=('BSD')
depends=('qt4')
makedepends=('make' 'svn')
conflicts=()
source=()
#md5sums=('')

build() {
    cd ${srcdir}/

    svn checkout http://wagic.googlecode.com/svn/trunk/ wagic-read-only

    cd wagic-read-only/projects/mtg

    sed -i 's/-Werror//g' wagic-qt.pro
    qmake-qt4 wagic-qt.pro

    make
}

package() {
    cd ${srcdir}/wagic-read-only/projects/mtg
    make INSTALL_ROOT=${pkgdir} install
}
