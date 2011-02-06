# Contributor: Juanma Hernández <juanmah@gmail.com>
pkgname=otf-symbola
pkgver=6.02
pkgrel=1
pkgdesc="Symbol Blocks Font of the Unicode Standard"
url="http://users.teilar.gr/~g1951d/"
arch=('any')
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
install=otf.install
source=('http://users.teilar.gr/~g1951d/Symbola602.zip')
md5sums=('48b62a44f0c3971b4882648a1c19f428')

build() {
  # Font installation
  install -d ${pkgdir}/usr/share/fonts/OTF
  install -m644 *.otf ${pkgdir}/usr/share/fonts/OTF
}
