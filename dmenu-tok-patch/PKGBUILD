# Maintainer: StephenB <mail4stb at gmail .com>

_pkgname=dmenu
pkgname=dmenu-tok-patch
pkgver=4.2.1
pkgrel=1
pkgdesc="dmenu patched to use space separated tokens to match menu items (xmms like pattern matching)"
url="http://tools.suckless.org/dmenu/patches/xmms-like_pattern_matching"
arch=('i686' 'x86_64')
license=('MIT')
depends=('sh' 'libxinerama')
provides=("dmenu")
conflicts=("dmenu")
source=("http://tools.suckless.org/dmenu/patches/dmenu-$pkgver-tok.diff"
        "http://dl.suckless.org/tools/$_pkgname-$pkgver.tar.gz")
md5sums=('88404d690c989993ad57593e532410a1'
         '5c95f974fa0c723f46838d0d5fbf5aca')

build(){
  cd $srcdir/$_pkgname-$pkgver

  patch -p1 -i "../dmenu-$pkgver-tok.diff"

  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  make PREFIX=/usr DESTDIR=$pkgdir install

  #install license
  install -m644 -D LICENSE $pkgdir/usr/share/licenses/$_pkgname/LICENSE
}
