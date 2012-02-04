# Contributor: Jay Tanzman <jt512 at archlinux dot us>
pkgname=mozilla-tiff-plugin
pkgver=0.4
pkgrel=2
pkgdesc="Plugin for viewing tiff files in Firefox and Mozilla browsers"
arch=('x86_64')
url="http://tiff-plugin.vinay.in/"
license=('unknown')
depends=('libtiff' 'gtk2' 'cairo>=1.10.0')
makedepends=('pkgconfig')
source=(http://downloads.sourceforge.net/tiff-plugin/${pkgname}-${pkgver}.tar.gz
        http://ftp.mozilla.org/pub/mozilla.org/xulrunner/nightly/2008/07/2008-07-24-06-xulrunner1.9.0.1/xulrunner-1.9.0.1.en-US.linux-i686.sdk.tar.bz2)
md5sums=('fb073bf9572fa39db5b577de0fb956ee'
         'd683b2f44cc086a133f59437a694dbf8')

build() {
  cd "$srcdir/$pkgname"
  sed -i.orig -r -e 's|PLUGIN_INCLUDE.*firefox/nspr|PLUGIN_INCLUDE=-I../xulrunner-sdk/sdk/include/|' -e '25,34 d' Makefile

  make clean || return 1
  make || return 1
  make plugin || return 1
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/lib/mozilla/plugins
  install mozilla-tiff-viewer "$pkgdir/usr/bin"
  install mozilla-tiff-plugin.so "$pkgdir/usr/lib/mozilla/plugins"
}

# vim:set ts=2 sw=2 et:
