# Maintainer: TDY <tdy@archlinux.info>

pkgname=ttf-arkpandora
pkgver=2.04
pkgrel=2
pkgdesc="A drop-in replacement font pack for Arial and Times New Roman (Aerial/Tymes/Veranda)"
arch=('any')
url="http://ostatic.com/arkpandorafonts/"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
source=(ftp://ftp.fi.debian.org/pub/gentoo/distfiles/$pkgname-$pkgver.tgz)
sha256sums=('a1fc953c98d00fcc3ef168044c5d9470995f6d2b0a42006c1f7a1bfb28efae9a')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -dm755 "$pkgdir/usr/share/fonts/TTF"
  install -cm644 *.ttf "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 COPYRIGHT.TXT "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
