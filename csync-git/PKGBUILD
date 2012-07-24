# Maintainer: Scott Garrett <Wintervenom [(at)] archlinux.us>

pkgname=csync-git
pkgver=20120723
pkgrel=2
pkgdesc="A file synchronizer especially designed for you, the normal user."
arch=("i686" "x86_64")
url="http://www.csync.org"
license=('GPL2')
depends=('log4c' 'sqlite3' 'iniparser' 'neon' 'smbclient' 'libssh' 'git')
makedepends=('cmake')
provides=('csync' 'csync-owncloud')
conflicts=('csync' 'csync-owncloud')
_gitroot="git://git.csync.org/projects/csync.git"
_gitname="csync"

build () {
    cd "$srcdir"
    msg "Connecting to GIT server..."
    if [[ -d $_gitname ]]; then
        cd $_gitname && git pull origin
        msg "The local files are updated."
    else
        git clone $_gitroot
    fi
    msg "GIT checkout done or server timeout."
    msg "Starting make..."

    [[ -d "$srcdir/$_gitname-build" ]] &&
        rm -rf "$srcdir/$_gitname-build"
    cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
    cd "$srcdir/$_gitname-build"

    cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DSYSCONF_INSTALL_DIR=/etc \
        -DLOG_TO_CALLBACK=on \
        ../$_gitname
    make
}
package () {
    cd "$srcdir/$_gitname-build"
    make DESTDIR=$pkgdir install
}
