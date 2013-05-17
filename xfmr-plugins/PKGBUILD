# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=xfmr-plugins
pkgver=0.0.3
pkgrel=1
pkgdesc="John Rigg LADSPA plugins"
arch=(i686 x86_64)
url="http://www.jrigg.co.uk/linuxaudio/xfmr-plugins.html"
license=('LGPL')
groups=('ladspa-plugins')
depends=('ladspa')
source=("http://www.jrigg.co.uk/linuxaudio/download/plugin/$pkgname-$pkgver.tar.gz")
md5sums=('94deae7504f90eb7d2a61a36179f9b93')

build() {
  cd "$srcdir/$pkgname-$pkgver/src"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # plugin
  install -Dm755 plugins/transformer_4661.so \
    "$pkgdir/usr/lib/ladspa/transformer_4661.so"

  # doc
  install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README"
}

# vim:set ts=2 sw=2 et:
