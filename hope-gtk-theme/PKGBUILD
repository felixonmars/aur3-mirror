# Maintainer: Logan Dam <dam dot loganza at gmail dot com>
pkgname=hope-gtk-theme
pkgver=20120317
pkgrel=1
pkgdesc="A dark/light mix GTK2/3 theme by 0rAX0"
arch=('any')
url="http://grvrulz.deviantart.com/art/Hope-gtk3-206207315"
license=('GPL3')
depends=('gtk2' 'gtk3' 'gtk-engine-unico')
makedepends=('p7zip')
optdepends=('awoken-icons: for nice looking icons')
source=(http://www.deviantart.com/download/206207315/hope_gtk3_by_grvrulz-d3erqkz.7z)
noextract=()
md5sums=('b8736d21fc86a8f291fb1c547e38f8fb')

package() {
  cd "$srcdir/Hope"
  install -d ${pkgdir}/usr/share/themes/${pkgname}
  cp -rf * ${pkgdir}/usr/share/themes/${pkgname} || return 1
}

# vim:set ts=2 sw=2 et:
