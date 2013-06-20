# Maintainer: Jeff Pohlmeyer <yetanothergeek at gmail dot com>

pkgname='lua-xctrl'
true && pkgname=('lua-xctrl' 'lua51-xctrl')

pkgbase=lua-xctrl
pkgver=2013.06.20
pkgrel=1
url="http://code.google.com/p/xctrl/"

arch=('i686' 'x86_64')
license=('GPL')
makedepends=('lua' 'lua51' 'libx11' 'libxmu' 'xproto')

source=(http://xctrl.googlecode.com/files/xctrl-${pkgver//./-}.tar.gz)
md5sums=('789f39228436e4c806911c6cbaae444a')

package_lua-xctrl() {
  depends=('lua' 'libx11' 'libxmu')
  cd $srcdir/xctrl-${pkgver//./-}
  make EXTRA_LDFLAGS=-fPIC || return
  install -D 'src/xctrl.so' "$pkgdir/usr/lib/lua/5.2/xctrl.so"
  install -D 'doc/lxctrl.html' "$pkgdir/usr/share/doc/lua-xctrl/lxctrl.html"
}

package_lua51-xctrl() {
  depends=('lua' 'libx11' 'libxmu')
  cd $srcdir/xctrl-${pkgver//./-}
  make EXTRA_CFLAGS=-I/usr/include/lua5.1 EXTRA_LDFLAGS=-fPIC || return
  install -D 'src/xctrl.so' "$pkgdir/usr/lib/lua/5.1/xctrl.so"
  install -D 'doc/lxctrl.html' "$pkgdir/usr/share/doc/lua51-xctrl/lxctrl.html"
}

pkgdesc='Lua module to manipulate an X11 window manager and its windows.'

