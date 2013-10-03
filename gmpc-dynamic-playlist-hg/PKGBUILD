# Contributor: Andre Klitzing <andre () incubo () de>
pkgname=gmpc-dynamic-playlist-hg
pkgver=308
pkgrel=1
pkgdesc="A plugin for adding similar songs to playlist"
arch=('i686' 'x86_64')
url="http://bitbucket.org/misery/dynamic-playlist/"
license=('GPL')
depends=('gmpc-git' 'libmpd-git')
makedepends=('pkgconfig' 'mercurial' 'cmake>=2.6.0')
source=()

_hgroot=https://bitbucket.org/misery/dynamic-playlist
_hgrepo=dynamic-playlist

build() {
    cd "${srcdir}"

    if [ -d ${_hgrepo} ]; then
        cd ${_hgrepo}
        hg pull || return 1
        hg update -r $pkgver || return 1
    else
        hg clone -r $pkgver ${_hgroot} ${_hgrepo} || return 1
        cd ${_hgrepo}
    fi

    msg "Mercurial checkout done or server timeout"
    msg "Starting make..."

    cmake -D CMAKE_INSTALL_PREFIX=/usr . || return 1
    make DESTDIR="$pkgdir/" install || return 1
}

# vim:set ts=4 sw=4 et:
