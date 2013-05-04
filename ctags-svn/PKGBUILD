# Maintainer: Karol "Kenji Takahashi" Woźniak <kenji.sx>

pkgname=ctags-svn
pkgver=804
pkgrel=1
pkgdesc="Generates an index file of language objects found in source files. SVN trunk."
arch=('i686' 'x86_64')
url="http://ctags.sourceforge.net/"
license=('GPL')
depends=('glibc')
makedepends=('subversion')
conflicts=('ctags')
provides=('ctags')
source=("${pkgname}::svn+https://ctags.svn.sourceforge.net/svnroot/ctags/trunk")
md5sums=('SKIP')

pkgver() {
    cd $SRCDEST/${pkgname}
    svnversion | tr -d [A-z]
}

build() {
    cd ${srcdir}/${pkgname}

    autoheader
    autoconf
    ./configure --prefix=/usr \
                --disable-external-sort
    make
}

package() {
    cd ${srcdir}/${pkgname}

    make prefix=${pkgdir}/usr install
}
