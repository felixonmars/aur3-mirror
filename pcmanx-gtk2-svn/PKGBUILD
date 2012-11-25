# Contributor: Lyman Li <lymanrb@gmail.com>

pkgname=pcmanx-gtk2-svn
pkgver=588
pkgrel=1
pkgdesc="A gtk+ based free BBS client"
arch=('i686' 'x86_64')
url="http://code.google.com/p/pcmanx-gtk2"
license=('GPL')
depends=('gtk2' 'wget')
makedepends=('autoconf' 'automake' 'subversion' 'intltool')
options=('!libtool')
provides=('pcmanx-gtk2')
conflicts=('pcmanx-gtk2')
source=(pcmanx.install fontconfig.diff)
md5sums=('6374916400684c2db957be0250a4ca98' 'bcb3e1995a7359f0fb09219f8effa6bd')
install=pcmanx.install

_svntrunk=http://pcmanx-gtk2.googlecode.com/svn/trunk
_svnmod=pcmanx-gtk2

build() {
    cd ${srcdir}

    if [ -d $_svnmod/.svn ]; then
        (cd $_svnmod && svn up -r $pkgver)
    else
        svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
    fi

    msg "SVN checkout done or server timeout"
    msg "Starting make..."

    rm -rf $_svnmod-build
    svn export $_svnmod $_svnmod-build
    cd $_svnmod-build

    msg "applying fontconfig patch"
    patch -p0 < ../fontconfig.diff

    ./autogen.sh
    ./configure --prefix=/usr --enable-wget --enable-iplookup || return 1
    make || return 1
    make DESTDIR=${startdir}/pkg install || return 1
}
