pkgname=ttf-typed
pkgver=2011.10.01
pkgrel=1
pkgdesc="Fixed-width TrueType font"
arch=(any)
url="http://code.google.com/p/i3project"
license=('custom:Public Domain')
source=("http://i3project.googlecode.com/files/all_fonts_01102011.zip")
sha512sums=('f1f166fc8ccd83942acbbc0f3ff49d1dbb15feb9050dd44ac5ceef4d61a32c8a0a20ac11fce594f653e52b152cf19fa2617e20f077f5eb1fef8d24ced9e4578e')

build() {
  install -D -m 644 "$srcdir/all_fonts_01102011/typed.ttf" "$pkgdir/usr/share/fonts/TTF/typed.ttf"
  install -D -m 644 "$srcdir/all_fonts_01102011/UNLICENSE.txt" "$pkgdir/usr/share/licenses/ttf-typed/COPYING"
}

