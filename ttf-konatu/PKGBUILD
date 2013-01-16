# Maintainer: TDY <tdy@archlinux.info>

pkgname=ttf-konatu
pkgver=25
pkgrel=1
pkgdesc="A Japanese TrueType font originally for BeOS"
arch=('any')
url="http://www.masuseki.com/index.php?u=be/konatu.htm"
license=('CCPL:by-sa')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
source=(http://www.masuseki.com/be/konatu/Konatu_ver_$pkgver.zip)
md5sums=('38bd5e0c106b9a20ad53c2780e39e26b')

package() {
  cd "$srcdir/Konatu_ver_$pkgver"
  install -Dm644 Konatu.ttf "$pkgdir/usr/share/fonts/TTF/Konatu.ttf"
  install -Dm644 KonatuTohaba.ttf "$pkgdir/usr/share/fonts/TTF/KonatuTohaba.ttf"
}

# vim:set ts=2 sw=2 et:
