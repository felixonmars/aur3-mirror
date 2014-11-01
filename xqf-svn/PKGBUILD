# Maintainer: Slash <demodevil5[at]yahoo[dot]com>

pkgname=xqf-svn
pkgver=837
pkgrel=2
pkgdesc="XQF is a game server browser and launcher for Unix/X11 for many popular games (a qstat frontend)"
url="http://xqf.sourceforge.net/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('qstat' 'gtk2' 'geoip')
makedepends=('subversion' 'intltool')
replaces=('xqf-cvs')
conflicts=('xqf' 'xqf-cvs')
provides=('xqf')
source=('xqf::svn+https://xqf.svn.sourceforge.net/svnroot/xqf/trunk/xqf')
sha256sums=('SKIP')

pkgver() {
    cd ${srcdir}/xqf
    svnversion | tr -d [A-z]
}

build() {
    cd ${srcdir}/xqf

    sed "s#pkglib_#pkglibexec_#g" -i src/Makefile.am

    ./autogen.sh --prefix=/usr
    ./configure --enable-gtk2 --prefix=/usr LIBS='/usr/lib/libX11.so.6 /lib/libdl.so.2'
    make
}

package() {
    cd ${srcdir}/xqf

    make DESTDIR=${pkgdir} install
}
