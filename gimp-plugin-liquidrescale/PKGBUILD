# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Kevin Brubeck Unhammer <unhammer@fsfe.org>
# Contributor: speps

pkgname=gimp-plugin-liquidrescale
_pkgname=gimp-lqr-plugin
pkgver=0.7.2
pkgrel=1
pkgdesc="Resizing pictures non uniformly while preserving their features, i.e. avoiding distortion of the important parts."
url="http://registry.gimp.org/node/25803"
arch=('i686' 'x86_64')
license=('custom:MIT')
depends=('gimp')
source=("http://liquidrescale.wdfiles.com/local--files/en:download-page-sources/$_pkgname-$pkgver.tar.bz2")
md5sums=('af7eb1a0d480bacfa6e5eff9b06bd877')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  ./configure --prefix=/usr
  make LDFLAGS="-lm $LDFLAGS"
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install

  # license
  install -Dm644 COPYING \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
