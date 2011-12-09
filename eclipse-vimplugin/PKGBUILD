# Maintainer: Peter Richard Lewis <plewis@aur.archlinux.org>

pkgname=eclipse-vimplugin
pkgver=0.3.0
pkgrel=1
epoch=
pkgdesc="An attempt to use the vim editor inside the eclipse IDE"
arch=('any')
url="http://vimplugin.org/"
license=('GPL')
groups=()
depends=('eclipse')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://sourceforge.net/projects/vimplugin/files/vimplugin/$pkgver/vimplugin_$pkgver.zip)
noextract=()
sha256sums=('62a997bedf48e9182a13922a10fa69a0dbf90da362c8a9c522da9ebded82bbe7')

build() {
  true
}


package() {
  cd "$srcdir/plugins"
  install -Dm644 "org.vimplugin.plugin_$pkgver.jar" "$pkgdir/usr/share/eclipse/plugins/org.vimplugin.plugin_$pkgver.jar"
}

# vim:set ts=2 sw=2 et:
