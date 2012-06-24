# Maintainer: fuzzix <fuzzix@gmail.com>

pkgname=xawtv4-git
pkgver=20120624
pkgrel=1
pkgdesc="Development version of the simple Xaw-based TV program which uses the v4l API"
arch=('i686' 'x86_64')
url="http://www.kraxel.org/blog/linux/xawtv/"
license=('GPL')
depends=('gtk2' 'libjpeg' 'libpng' 'alsa-lib' 'libdv' 'zvbi' 'libv4l'
         'libxxf86dga' 'libfs' 'libxrandr' 'libxv' 'libxaw'
         'libxxf86vm' 'libgl' 'gpm' 'lirc-utils' 'libxft' 'zvbi'
         'libmpeg2' 'libmad')
makedepends=('git')
conflicts=('xawtv')
#provides=('xawtv')
source=('xlibs.diff')
md5sums=('3fb53c08b04a0d73514a7ad28b19412e')

_gitroot=git://linuxtv.org/xawtv4.git
_gitname=xawtv4

build() {
    cd "$srcdir"
    msg "Cloning git repository"
    if [[ -d "$_gitname" ]]; then
        cd "$_gitname" && git pull origin
    else
        git clone --depth=1 "$_gitroot" "$_gitname"
        cd "$_gitname"
    fi

    msg "Applying Makefile.in link patches"
    git checkout Makefile.in
    patch -Nsp1 < ../xlibs.diff

    export LDFLAGS="-Wl,-O1,--sort-common,-z,relro"
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/$_gitname"
    make DESTDIR=$pkgdir install
    install -d "$pkgdir/usr/share/doc/$_gitname"
    install -Dm644 README* "$pkgdir/usr/share/doc/$_gitname"
    install -Dm644 NEW_IN_4 "$pkgdir/usr/share/doc/$_gitname"
    install -Dm644 TODO "$pkgdir/usr/share/doc/$_gitname"
}

