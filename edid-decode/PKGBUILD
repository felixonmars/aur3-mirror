pkgname=edid-decode
_ver=77-g95019a3
pkgver="${_ver/-/_}"
_ver="$pkgname-$_ver"
pkgrel=1
pkgdesc="EDID decoder and conformance tester"
url="http://cgit.freedesktop.org/xorg/app/edid-decode/"
arch=('i686' 'x86_64')
license=('MIT')
#~ depends=('ncurses')
#~ makedepends=('avr-libc')
source=\
("http://cgit.freedesktop.org/xorg/app/$pkgname/snapshot/$_ver.tar.gz")
md5sums=(4cf04ffbca1dc8f0cc96330a361e488c)

build() {
    make -C "$srcdir/$_ver"
}

package() {
    make -C "$srcdir/$_ver" install DESTDIR="$pkgdir"
}
