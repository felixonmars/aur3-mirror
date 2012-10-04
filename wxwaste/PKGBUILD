# Contributor: Prurigro
# Maintainer: Prurigro

pkgname=wxwaste
pkgver=1.5_beta_4
pkgrel=1
pkgdesc="A mesh-based workgroup tool that allows for encrypted, private communication between distant parties on the internet, independant of local network organization."
url="http://sourceforge.net/projects/waste/"
license="GPLv2"
depends=('wxgtk')
makedepends=('make' 'gcc')
arch=('i686' 'x86_64')
source=("http://downloads.sourceforge.net/project/waste/wxWASTE%20Client_Server%20%28POSIX%29/v1.5%20beta%204/${pkgname}_${pkgver}.tar.gz"
        "gcc.patch"
        "waste.sh"
        "waste.desktop")
sha1sums=('a5fe49b76398ed976424f66aec01434f0a6cf294'
          'd78d5dd71fdef772168fcd188de273489ec983c7'
          '85b31e14220114849307efb1d7b8a596aaa7158f'
          'cafe3194892a8f6898da05c512d3fff422cbea0f')

export CPPFLAGS="-Wno-write-strings"

build() {
    pushd "${srcdir}"/waste
        patch -p0 < ../gcc.patch
        ./configure --prefix=/usr
        make
    popd
}

package() {
    pushd "${srcdir}"
        install -D -m755 waste.sh "${pkgdir}"/usr/bin/waste
        install -D -m644 waste.desktop "${pkgdir}"/usr/share/applications/waste.desktop
        install -D -m755 waste/waste "${pkgdir}"/usr/share/waste/waste-binary
        cp -r waste/res "${pkgdir}"/usr/share/waste/
    popd
}
