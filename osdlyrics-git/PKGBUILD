# Maintainer: Jove Yu <yushijun110 [at] gmail [dot] com>


pkgname=osdlyrics-git
_pkgname=osdlyrics
pkgver=0.5.0
pkgrel=20121015
pkgdesc="A lyric show compatible with various media players"
arch=('i686' 'x86_64')
url="http://code.google.com/p/osd-lyrics/"
license=('GPL3')
depends=('gtk2' 'dbus-glib' 'curl' 'libnotify' 'sqlite3'
         'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('intltool')
optdepends=('libmpd: MPD support'
            'xmms2:   XMMS2 support')
install=$pkgname.install

_gitroot="git://github.com/osdlyrics/osdlyrics"

build() {
    cd $srcdir
    msg "Connecting to  GIT server...."

    if [[ -d $srcdir/$_pkgname ]]; then
    	cd $_pkgname
    	git pull  || return 1
    	msg "The local files are updated."
    else
    	git clone $_gitroot
    fi
    
    msg "GIT checkout done or server timeout"
    msg "Starting make..."
    
    cd $srcdir/$_pkgname

    autoreconf --install --force
    ./configure PYTHON=/usr/bin/python2

    make || return 1
    make DESTDIR=$pkgdir install || return 1

    #cp $pkgdir/usr/local/lib/osdlyrics $pkgdir/usr/lib/osdlyrics 
    #cp $pkgdir/usr/local/lib/python2.7/site-packages/osdlyrics $pkgdir/usr/lib/python2.7/site-packages/osdlyrics

}
