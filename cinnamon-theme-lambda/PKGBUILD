# Maintainer: Logan Dam <dam dot loganza at gmail dot com>
pkgname=cinnamon-theme-lambda
pkgver=120618
pkgrel=1
pkgdesc="A simple theme made by mixing the default Cinnimon theme, Zukitwo Cinnamon theme, ElementaryOS Cinnamon theme and Elementary Luna Mod Gnome-Shell themes."
arch=('any')
url="http://ponygon101.deviantart.com/art/Lambda-Cinnamon-Theme-309027595"
license=('custom')
depends=('cinnamon')
#makedepends=('unzip')
source=(http://fc03.deviantart.net/fs70/f/2012/169/f/a/lambda_cinnamon_theme_by_ponygon101-d53zj7v.zip)
md5sums=('10acc082cc8ce0c696543a484947aec2')

package() {
  cd "$srcdir/Lambda/"
  install -d ${pkgdir}/usr/share/licenses/cinnamon-theme-lambda
  cp License ${pkgdir}/usr/share/licenses/cinnamon-theme-lambda/
  cd "$srcdir/Lambda/cinnamon"
  install -d ${pkgdir}/usr/share/themes/${pkgname}/cinnamon
  cp -rf * ${pkgdir}/usr/share/themes/${pkgname}/cinnamon || return 1
}

# vim:set ts=2 sw=2 et:
