# Maintainer: aion <alex.teorver@gmail.com>
pkgname=uqm-russian
pkgver=1.1.0_rc3
pkgrel=1
pkgdesc="Russian addon for 'The Ur-Quan Masters' game"
arch=('any')
url="http://uqm-rus.uvw.ru/"
license=('GPL')
depends=('uqm>=0.7.0')
makedepends=('unzip')
source=("http://jini-zh.org/uqm/russian-${pkgver//_/-}.zip")
noextract=("russian-${pkgver//_/-}.zip")
md5sums=('04fa190f47298c78017bc145551ea9df') #generate with 'makepkg -g'

build() {
  cd "$srcdir"
  
  unzip "russian-${pkgver//_/-}"
}

package() {
  cd "$srcdir"
  
  install -Dm644 russian.zip "$pkgdir/usr/share/uqm/content/addons/russian.zip"
  install -Dm644 AUTHORS     "$pkgdir/usr/share/doc/$pkgname/AUTHORS"
  install -Dm644 README      "$pkgdir/usr/share/doc/$pkgname/README"
  
}

# vim:set ts=2 sw=2 et:
