# Maintainer: Kasper Menten <kasper dot menten at gmx dot com>

pkgname=ttf-mockfonts
pkgver=1
pkgrel=1
pkgdesc="Truetype Fonts by Curtis Clark"
arch=('any')
url="http://www.mockfont.com/old/"
license=('custom')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=$pkgname.install
_fpath="http://www.mockfont.com/old/files"
source=($_fpath/blnttf11.zip $_fpath/fmsymb.zip  $_fpath/linarb10.zip
        $_fpath/moonttf.zip  $_fpath/pie4mp11.zip $_fpath/runettf.zip
        $_fpath/woolbats.zip)
md5sums=('54d437d00fc2b6b7cd413b4a1f06f234'
         'f4dc70d635eefe1f24da16b952ba6a20'
         '4906f96a67c23868d1eb955464aa7e40'
         '564e8d23e7c1ee4a0c5760009e72bd73'
         'a0aa042d297180e851021b2dc2f501e4'
         'ae63098448baf75cbaafa76ca63c0a24'
         '2c3800f5adb6d02a73ae4e0da0f881a6')


package() { 
  cd "$srcdir"
  install -dm755 "$pkgdir/usr/share/fonts/TTF"
  find . -type f -name \*.TTF -exec install -Dm644 '{}' \
    "$pkgdir/usr/share/fonts/TTF" \;
}
