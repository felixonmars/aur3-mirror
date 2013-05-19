# Maintainer: Bastien Dejean <baskerville@lavabit.com>

_pkgname=fontforge
pkgname=${_pkgname}-bskv-git
pkgver=15021
ftver=2.4.11
pkgrel=1
pkgdesc='An outline and bitmap font editor'
arch=('i686' 'x86_64')
url="http://${_pkgname}.sourceforge.net/"
license=('custom:BSD')
makedepends=('git')
optdepends=('libpng' 'libtiff' 'giflib' 'libjpeg' 'libxml2' 'libspiro' 'libunicodenames' 'libiconv' 'freetype2')
conflicts=('fontforge')
provides=('fontforge')
source=("git://github.com/fontforge/${_pkgname}.git" "http://downloads.sourceforge.net/project/freetype/freetype2/${ftver}/freetype-${ftver}.tar.bz2")
md5sums=('SKIP' 'b93435488942486c8d0ca22e8f768034')

pkgver() {
    cd "$srcdir/$_pkgname"
    git rev-list --count HEAD
}

build() {
    cd "$srcdir/$_pkgname"
    ./autogen.sh
    ./configure --prefix=/usr --with-freetype-source=../freetype-${ftver} PYTHON=python2
    make
}

package() {
    cd "$srcdir/$_pkgname"
    make DESTDIR="$pkgdir" install
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
