# Maintainer: Guillaume Brunerie <guillaume.brunerie@[gmail.com|ens.fr]>
# Contributor: Colard Benjamin <caemirr@gmail.com>
pkgname=ryzom-client-official
pkgver=1122
pkgrel=4
pkgdesc="Ryzom is a Pay to Play MMORPG with a free demo. This version is for playing on an official server"
arch=('i686' 'x86_64')
url="http://www.ryzom.com/"
license=('AGPL3' 'CCPL:by-sa')

if [[ $CARCH == i686 ]]; then
    depends=('libgl' 'libxxf86vm' 'libxrandr')
else
    depends=('lib32-libgl' 'lib32-libxxf86vm' 'lib32-libxrandr')
fi

makedepends=('p7zip')
provides=('ryzom')
install=('ryzom-client-official.install')
source=(https://sourceforge.net/projects/ryzom/files/ryzom_client.7z
        ryzom
        ryzom_update)
md5sums=('dd4d093e041fa86579a30ea2514484fb'
         '1f5575825f35e62665d6c072670b2ab1'
         'cc6fa044158b2fea9a619150e6efc42a')

# The package is big and xz is slow
PKGEXT='.pkg.tar.gz'

build() {
    : # Nothing to do
}

package() {
    cd "$srcdir"

    7zr x -o"${pkgdir}"/opt ryzom_client.7z
    chown -R root:games "${pkgdir}"/opt/ryzom
    chmod -R g+w "${pkgdir}"/opt/ryzom
    chmod 755 "${pkgdir}"/opt

    mkdir -p "${pkgdir}"/usr/bin
    cp ryzom ryzom_update "${pkgdir}"/usr/bin
    chmod +x "${pkgdir}"/usr/bin/ryzom*
}
