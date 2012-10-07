# Maintainer: Thomas Laroche <tho.laroche @t gmail.com>
# Contributor:  TDY <tdy@gmx.com>
# Contributor: Thayer Williams <thayer@archlinux.org>
# Contributor: dale <dale@archlinux.org>

pkgname=ttf-blankon-ombilin
pkgver=0.7
pkgrel=1
pkgdesc="Font from Indonesia local distro BlankOn Linux"
arch=('any')
url="http://blankonlinux.or.id"
license=('LGPL')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=ttf.install
source=(http://arsip.blankonlinux.or.id/blankon-legacy/pool/main/t/ttf-blankon-ombilin/ttf-blankon-ombilin_${pkgver}.tar.gz)
sha256sums=('85866ae20c13e1df270fc7cccb0e9d9aa21a36b06e240065122648651874b139')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  install -Dm644 ombilin.ttf "$pkgdir/usr/share/fonts/truetype/ombilin.ttf"
}
