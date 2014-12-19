# Maintainer: Ivan Petruk <localizator@ukr.net>

pkgname=paper-gtk-theme
pkgver=1.0
pkgrel=1
pkgdesc='Paper GTK theme.'
arch=('any')
url='http://snwh.org/paper/'
license=('GPL')
depends=('gtk-engine-murrine')
groups=('gnome')
source=("${pkgname}.tar.gz::https://github.com/snwh/${pkgname}/raw/master/${pkgname}.tar.gz")
sha256sums=('SKIP')

package() {
  cd Paper

  install -dm 755 "$pkgdir"/usr/share/themes/Paper
  rm -rf .git .gitignore CREDITS LICENSE AUTHORS install.sh
  cp -dr --no-preserve='ownership' * "$pkgdir"/usr/share/themes/Paper/
}

# vim: ts=2 sw=2 et:
