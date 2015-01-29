# Maintainer: Pierre Chapuis <catwell at archlinux dot us>

# NOTE: This package relies on Mplayer's configure script to detect what is
# useful on your system. Build it on the machine you will use it on.
# If some features don't work, install the related optdepends *before*
# building.
# Before reporting any bug, please download a fresh copy of the package from
# the AUR and build the package using makepkg (not Yaourt).

pkgname=mplayer-minimal-svn
pkgver=r37363
pkgrel=1
pkgdesc='Famous multimedia player, dev. version, without its GUI'
arch=('i686' 'x86_64')
url='http://www.mplayerhq.hu/'
license=('GPL')
depends=('ttf-dejavu')
makedepends=('subversion' 'yasm' 'git')
optdepends=('freetype2: subtitles and OSD')
replaces=('mplayer-nogui-svn')
conflicts=('mplayer')
provides=("mplayer=$pkgver")
options=('!buildflags' '!emptydirs')
source=("$pkgname::svn://svn.mplayerhq.hu/mplayer/trunk/")
md5sums=('SKIP')

pkgver () {
    cd "$pkgname"
    local ver="$(svnversion)"
    printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
    cd "$pkgname"

    yes | ./configure --prefix=/usr --confdir=/etc/mplayer --disable-gui \
        --disable-runtime-cpudetection --enable-menu \
        --disable-x264 --disable-gif --disable-mencoder \
        --extra-cflags=-fno-strict-aliasing

    make
}

package () {
    cd "$pkgname"
    make -j1 DESTDIR="$pkgdir" install

    install -m0644 etc/{codecs.conf,input.conf,example.conf} \
        "$pkgdir/etc/mplayer"

    install -d "$pkgdir/usr/share/mplayer/"

    ln -s /usr/share/fonts/TTF/DejaVuSans.ttf \
        "$pkgdir/usr/share/mplayer/subfont.ttf"
}
