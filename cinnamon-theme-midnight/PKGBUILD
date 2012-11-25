# Maintainer: Logan Dam <dam dot loganza at gmail dot com>
pkgname=cinnamon-theme-midnight
pkgver=1.2
pkgrel=1
pkgdesc="A dark theme for Cinnamon"
arch=('any')
url="http://razor020.deviantart.com/art/Cinnamon-Midnight-Theme-308771643"
license=('unkown')
depends=('cinnamon')
#makedepends=('unzip')
source=(http://www.deviantart.com/download/308771643/cinnamon___midnight_theme_by_razor020-d53u1q3.zip)
md5sums=('1a96bbd695415cd40c7ee3760df3f3e5')

package() {
  cd "$srcdir/Midnight"
  install -d ${pkgdir}/usr/share/themes/${pkgname}
  cp -rf * ${pkgdir}/usr/share/themes/${pkgname} || return 1
}

# vim:set ts=2 sw=2 et:
