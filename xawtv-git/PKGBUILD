# Maintainer: fuzzix <fuzzix@gmail.com>

pkgname=xawtv-git
pkgver=20120624
pkgrel=1
pkgdesc="A simple Xaw-based TV program which uses the bttv driver or video4linux (v3 dev branch)"
arch=('i686' 'x86_64')
url="http://www.kraxel.org/blog/linux/xawtv/"
license=('GPL')
depends=('aalib'  'v4l-utils'  'libxv'  'libxxf86dga'  'libxrandr'
         'libgl'  'libdv'  'zvbi'  'libxinerama'  'lirc-utils'
         'libxft'  'libxaw'  'xorg-fonts-misc'  'libxxf86vm')
makedepends=('git')
conflicts=('xawtv')
provides=('xawtv')
source=()
md5sums=()

_gitroot=git://linuxtv.org/xawtv3.git
_gitname=xawtv3

build() {
    cd "$srcdir"
    msg "Cloning git repository"
    if [[ -d "$_gitname" ]]; then
        cd "$_gitname" && git pull origin
    else
        git clone --depth=1 "$_gitroot" "$_gitname"
        cd "$_gitname"
    fi

    ./autogen.sh
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/$_gitname"
    make DESTDIR=$pkgdir install
    install -d "$pkgdir/usr/share/doc/$_gitname"
    install -Dm644 README* "$pkgdir/usr/share/doc/$_gitname"
    install -Dm644 TODO "$pkgdir/usr/share/doc/$_gitname"
}

