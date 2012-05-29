  # Maintainer: bzt <unmacaque at gmail.com>
pkgname=keepassx-faenza-icons
pkgver=0.4.3
pkgrel=1
pkgdesc="A Faenza-styled icon theme for KeePassX (overrides default icons)"
arch=('any')
url="http://www.keepassx.org/"
license=('GPL')
depends=('keepassx' 'faenza-icon-theme')
install=keepassx-faenza-icons.install
source=('icons.list')
md5sums=('d0110ca826205be688d5b48c9b1327cd')

package() {
  install -D -m644 "${srcdir}"/icons.list "${pkgdir}"/usr/share/keepassx/icons/icons.list
}

# vim:set ts=2 sw=2 et:
