# chisiyuan < 14cheese at gmail dot com >

pkgname=lilyterm-modified
pkgver=0.9.8
pkgrel=1
pkgdesc="Lilyterm, but disable shortcut key and confirm dialog when run with -e COMMAND by default"
arch=('i686' 'x86_64')
url="http://lilyterm.luna.com.tw/index_en.html"
license=('GPLv3')
depends=('vte')
conflicts=('lilyterm')
makedepends=('gettext' 'intltool' 'pkgconfig>=0.16')
source=(http://lilyterm.luna.com.tw/file/lilyterm-$pkgver.tar.gz)
md5sums=('995f7b4634523bf5e150b529a4bdbf6f') #generate with 'makepkg -g'

build() {
    cd $srcdir/lilyterm-$pkgver
    sed -e '341s/=.*/= TRUE;/' -i src/window.c || return 1
    sed -e '136s/TRUE/FALSE/' -i src/profile.c || return 1
    ./autogen.sh || return 1
    ./configure --prefix=/usr --sysconfdir=/etc || return 1
    make || return 1
    make DESTDIR=$pkgdir install || return 1
    install -Dm644 COPYING \
        "$pkgdir/usr/share/licenses/lilyterm/COPYING" || return 1
}
