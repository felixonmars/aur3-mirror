# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=setbfree
pkgver=0.7.5
pkgrel=1
pkgdesc="A DSP Tonewheel Organ emulator."
arch=(i686 x86_64)
url="http://setbfree.org/"
license=('GPL')
depends=('jack' 'liblo' 'tk' 'desktop-file-utils')
makedepends=('lv2')
install="$pkgname.install"
source=("https://github.com/pantherb/setBfree/tarball/v$pkgver"
        "https://raw.github.com/pantherb/setBfree/master/debian/setbfree.desktop")
md5sums=('d018bbb9630cf008998967f6c21c0eca'
         '8c2a863562f26856dcff0a456cf36dcf')

build() {
  cd "$srcdir/pantherb"*
  make PREFIX=/usr
}

package() {
  cd "$srcdir/pantherb"*
  make DESTDIR="$pkgdir/" PREFIX=/usr install

  # desktop file
  install -Dm644 ../$pkgname.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"

  # icon
  install -Dm644 doc/setBfree.png \
    "$pkgdir/usr/share/icons/setBfree.png"

  # man
  install -d "$pkgdir/usr/share/man/man1"
  install -Dm644 doc/*.1 \
    "$pkgdir/usr/share/man/man1"

  # docs
  install -d "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 doc/{midi.txt,signal_flow.png} \
    "$pkgdir/usr/share/doc/$pkgname"
}

# vim:set ts=2 sw=2 et:
