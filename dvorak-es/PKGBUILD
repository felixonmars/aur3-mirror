# Maintainer: Gerardo Marset <gammer1994@gmail.com>
pkgname=dvorak-es
pkgver=0
pkgrel=1
pkgdesc="The spanish variation of the Dvorak keyboard layout for console."
arch=('any')
url="http://djelibeibi.unex.es/dvorak/"
license=('unknown')
depends=('kbd')
source=($pkgname-$pkgver.tar.gz)
md5sums=('9a83e55979fa555eb7ade95bfc7a06cb')

package() {
  cd $srcdir
  install -Dm644 "${pkgname}.map.gz" ${pkgdir}/usr/share/kbd/keymaps/i386/dvorak/${pkgname}.map.gz || return 1
}

# vim:set ts=2 sw=2 et:
