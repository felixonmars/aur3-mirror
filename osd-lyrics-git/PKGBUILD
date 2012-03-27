# Maintainer: Tolbkni Kao <tolbkni@gmail.com>
pkgname=osd-lyrics-git
pkgver=20111231
pkgrel=1
pkgdesc="An OSD lyric show supporting multiple media players and downloading."
arch=('i686' 'x86_64')
url="http://code.google.com/p/osd-lyrics/"
license=('GPL3')
depends=('curl' 'dbus-glib' 'desktop-file-utils' 'gtk2' 'hicolor-icon-theme' 'libnotify' 'sqlite3')
makedepends=('git' 'pkgconfig' 'intltool')
optdepends=('libmpd: MPD support'
            'xmms2: XMMS2 support')
conflicts=('osdlyrics')
provides=('osdlyrics')
install=$pkgname.install

_libmpd=false
_xmms2=false

_gitroot="git://github.com/osdlyrics/osdlyrics.git"
_gitname="osd-lyrics"
_branchname="develop"

build() {
    cd "$srcdir"
    msg "Connecting to github.com GIT server"
    
    if [ -d $_gitname ] ; then
        cd $_gitname && git pull origin
        msg "The local files are updated."
    else
        git clone --depth=1 $_gitroot $_gitname --branch $_branchname
    fi
    
    msg "GIT checkout done or server timeout"
    
    msg "Starting make..."

    rm -rf "$srcdir/$_gitname-build"
    cp -R "$srcdir/$_gitname" "$srcdir/$_gitname-build"
    cd "$srcdir/$_gitname-build"

    ./autogen.sh

    if [ "$_libmpd" = "false" ] ; then
	    options="$options --disable-mpd"
    fi

    if [ "$_xmms2" = "false" ] ; then
	    options="$options --disable-xmms2"
    fi

    ./configure --prefix=/usr $options
    make
}

package()
{
    cd "$srcdir/$_gitname-build"
    make DESTDIR="$pkgdir/" install
}
