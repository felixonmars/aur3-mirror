# Contributor: Michael Towers <mt.42@web.de>

pkgname=xkmap
pkgver=1.2
pkgrel=2
pkgdesc="A keymap setter for xorg: a simple graphical front-end for setxkbmap"
license="GPL"
depends=('pygtk' 'python2')
url="http://none"
source=(xkmap xkmap.glade)
arch=(any)
md5sums=('e403e8b489263dd7cc7c4b82e42b1a42'
         'e634630e8c96baccfb6544f39537d937')

build() {
  mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/share"
  cp "$startdir/src/xkmap" "$pkgdir/usr/bin"
  chmod 0755 "$pkgdir/usr/bin/xkmap"
  cp "$startdir/src/xkmap.glade" "$pkgdir/usr/share"
}

