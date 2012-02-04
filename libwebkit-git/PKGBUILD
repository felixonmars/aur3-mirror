# Contributer: Zariel <c.bannister@gmail.com>

pkgname=libwebkit-git
pkgver=20090921
pkgrel=1
pkgdesc="An opensource web content engine"
arch=('i686' 'x86_64')
url="http://webkit.org/"
license=('custom')
depends=('libxt' 'libxslt' 'curl' 'sqlite3' 'gtk2' 'icu>=4.0' 'libsoup-git' 'gstreamer0.10-base')
makedepends=('git' 'gperf' 'gtk-doc' 'bison' 'autotoolset')
provides=('webkitgtk-svn' 'libwebkit' 'libwebkit=1.1.4')
conflicts=('libwebkit')
options=('!libtool')

_gitroot="git://git.webkit.org/WebKit.git"
_gitname="webkit"


build() {
    cd "$srcdir"

    if [ -d $_gitname ]; then
        cd $_gitname

        msg "Cleaning ..."
        make -f GNUmakefile clean > /dev/null

        msg "Updating from git ..."
        git fetch origin
        git merge origin/master
    else
        msg "Cloning git Tree ..."
        git clone $_gitroot $_gitname
    fi

    cd "$srcdir/$_gitname"

    msg "Starting build ..."

    ./autogen.sh --prefix=/usr \
        --enable-video \
        --with-font-backend=freetype \
        --enable-jit || return 1

    make -f GNUmakefile || return 1
    make -f GNUmakefile DESTDIR="$pkgdir" install || return 1

    # install license
    install -Dm644 ${srcdir}/$_gitname/WebKit/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
