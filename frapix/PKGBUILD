# Maintainer:  trougnouf
# Contributor: N30N <archlinux@alunamation.com>

pkgname=frapix
pkgver=20150128.15
pkgrel=1
pkgdesc="Free utility to view and optionally limit the framerate of any UNIX OpenGL program. Additionally it lets you capture still images and videos from OpenGL programs."
arch=("i686" "x86_64")
url="http://code.google.com/p/frapix"
license=('GPL3')
depends=('libimago2-svn')
makedepends=('subversion')
source=("frapix-read-only::svn+http://frapix.googlecode.com/svn/trunk/")
sha1sums=('SKIP')

pkgver() {
    cd "${SRCDEST}/src/frapix-read-only/frapix"
    echo $(date +%F | tr -d -).$(svnversion)
}

build() {
    cd "${srcdir}/frapix-read-only/frapix"
    make
}

package() {
    cd "${srcdir}/frapix-read-only/frapix"
    install -d "${pkgdir}/usr/"{lib,bin}
    make PREFIX="${pkgdir}/usr/" install
}
