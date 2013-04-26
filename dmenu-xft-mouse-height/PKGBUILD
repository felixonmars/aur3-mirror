# $Id: PKGBUILD 69620 2012-04-20 14:11:11Z bpiotrowski $
# Maintainer:  Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer:  Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: Thorsten Töpper <atsutane-tu@freethoughts.de>
# Contributor: Thayer Williams <thayer@archlinux.org>
# Contributor: Jeff 'codemac' Mickey <jeff@archlinux.org>

pkgname=dmenu-xft-mouse-height
pkgver=4.5
pkgrel=3
pkgdesc="Dynamic X menu - patched with Xft, mouse, height"
url="http://tools.suckless.org/dmenu/"
arch=('i686' 'x86_64')
license=('MIT')
depends=('sh' 'libxinerama' 'libxft')
conflicts=('dmenu')
provides=('dmenu')
source=(http://dl.suckless.org/tools/dmenu-$pkgver.tar.gz
        dmenu-4.5-xft.diff
        dmenu-4.5-mouse-support.diff
        dmenu-4.5-height.diff)
md5sums=('9c46169ed703732ec52ed946c27d84b4'
         '0c73d595eb78f159bea83f33bba15e80'
         'eeec3e11ff68f27ebbc3133ad6549f56'
         '2275475c3c25ee612defd1259802456d')

build(){
  cd $srcdir/dmenu-$pkgver
  patch -p1 < ../dmenu-4.5-xft.diff
  patch -p1 < ../dmenu-4.5-mouse-support.diff
  patch -p1 < ../dmenu-4.5-height.diff
  make \
    X11INC=/usr/include/X11 \
    X11LIB=/usr/lib/X11
}

package() {
  cd $srcdir/dmenu-$pkgver
  make PREFIX=/usr DESTDIR=$pkgdir install
  install -m644 -D LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
