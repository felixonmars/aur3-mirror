# Maintainer: chris_L <chrislcenter dash mamoru at yahoo.com dot mx>

pkgname=lilyterm-testing
pkgver=0.9.9_rc9
pkgrel=1
pkgdesc="A light and easy to use libvte based X terminal emulator (latest testing version)"
arch=('i686' 'x86_64')
url="http://lilyterm.luna.com.tw/index_en.html"
license=('GPLv3')
depends=('vte')
conflicts=('lilyterm'
'lilyterm-modified')
makedepends=('gettext' 'intltool' 'pkgconfig>=0.16')
source=("http://lilyterm.luna.com.tw/file/lilyterm-0.9.9~rc9.tar.gz")
md5sums=('78ca371786be7279a0ba6eccfabcbbac')

build() {
    cd "$srcdir/lilyterm-${pkgver//_/~}"
    ./autogen.sh || return 1
    ./configure --prefix=/usr --sysconfdir=/etc || return 1
    make || return 1
    make DESTDIR=$pkgdir install || return 1
    install -Dm644 COPYING \
        "$pkgdir/usr/share/licenses/lilyterm/COPYING" || return 1
}
