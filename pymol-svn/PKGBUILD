# Maintainter: Duca
# Contributor: yescalona
# Contributor: Carlos RÃ­os V. (aka crosvera)
# Contributor: Patrice Peterson <runiq at archlinux dot us>

pkgname=pymol-svn
_pkgname=pymol
pkgver=4064
pkgrel=1
pkgdesc="A user-sponsored molecular visualization system on an open-source foundation"
arch=('i686' 'x86_64')
url="http://pymol.sourceforge.net"
license=('GPL')
depends=('python2' 'freeglut' 'libpng' 'python2-numpy' 'python2-pmw' 'freetype2' 'glew')
makedepends=('subversion')
provides=('pymol')
conflicts=('pymol')
source=(${_pkgname}::svn+https://pymol.svn.sourceforge.net/svnroot/${_pkgname}/trunk/${_pkgname}
        pymol.desktop
        pymol.install
        pymol.jpg
        pymol.sh
        setup.py.patch)
md5sums=('SKIP'
         'f8c01dc0dae50925df5e203031fd6718'
         '60f02f33a00baffcba39c322c523ee28'
         'b23132933cf6c821a2f33ed08aa287d8'
         'a8e01f32b211dfd216a6f4747e49a4db'
         '6b1eb16b7e02a884f7925e315613c3cb')

pkgver() {
    cd ${_pkgname}
    local ver="$(svnversion)"
    printf "%s" "${ver//[[:alpha:]]}"
}

package() {
    cd ${_pkgname}

    python2 setup.py build install --root="${pkgdir}" --prefix=/usr

    install -D -m755 ../pymol.sh "${pkgdir}/usr/bin/pymol"
    install -D -m644 ../pymol.desktop "${pkgdir}/usr/share/applications/pymol.desktop"
    install -D -m644 ../pymol.jpg "${pkgdir}/usr/share/pixmaps/pymol.jpg"
}
