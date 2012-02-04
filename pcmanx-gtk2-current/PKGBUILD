# Contributor: Hiroshi Yui <hiroshiyui@gmail.com>

pkgname=pcmanx-gtk2-current
pkgver=535
pkgrel=1
pkgdesc="User-friendly telnet client mainly targets BBS users"
arch=('i686' 'x86_64')
url="http://code.google.com/p/pcmanx-gtk2/"
license=('GPL')
depends=('gtk2')
makedepends=('autoconf' 'automake' 'subversion')
options=('!libtool')
provides=('pcmanx-gtk2')
conflicts=('pcmanx-gtk2')
source=(pcmanx.install)
sha1sums=('79dbabb603bd70a0bf9bca051cbc1fe11d79aa30')
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

    cp -r $_svnmod $_svnmod-build
    cd $_svnmod-build

    # Remove fixed automake version
    sed -ie 's/=-1.10/=/g' autogen.sh

    ./autogen.sh
    ./configure --prefix=/usr --enable-wget --enable-iplookup --enable-static --disable-shared || return 1
    make || return 1
    make DESTDIR=${startdir}/pkg install || return 1
}

