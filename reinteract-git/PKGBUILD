# Maintainer: rememberthemer <rememberthemer@_GMAIL_DOT_COM_>

pkgname=reinteract-git
pkgver=20120207
pkgrel=1
pkgdesc="system for interactive experimentation with python."
arch=('any')
url="http://www.reinteract.org/"
license=('BSD')
depends=('pygtk' 'python2' 'desktop-file-utils' 'xdg-utils' 'hicolor-icon-theme')
optdepends=('python2-matplotlib: replot extension, allow in-line plotting'
            'sox: replay extension, basic operarions on audio files')
conflicts=('reinteract')
provides=('reinteract')
install=reinteract.install
_gitroot="git://git.fishsoup.net/reinteract"
_gitname="reinteract"

build() {
    cd "$srcdir"
    msg "Connecting to $_gitroot GIT server...."

    if [ -d "$srcdir"/$_gitname ] ; then
        (cd $_gitname && git pull origin)
        msg "The local files are updated."
    else
        git clone --depth=1 $_gitroot $_gitname
    fi

    rm -rf $_gitname-build
    cp -r  $_gitname $_gitname-build
    cd $_gitname-build

    # force configure to use python2
    PYTHON=/usr/bin/python2 ./autogen.sh --prefix=/usr
    make
}

package() {
    cd "$srcdir"/$_gitname-build 
    make install DESTDIR="$pkgdir"
    
    # cruchbang for python2
    sed -e 's/^\#\!\/usr\/bin\/env python\s*$/\#\!\/usr\/bin\/env python2/' \
        -i "$pkgdir"/usr/bin/$_gitname
    install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}

# vim: set et sw=4 ts=4 sts=4:
