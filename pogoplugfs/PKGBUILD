# Maintainer: Sara <sara at archlinux dot us>

pkgname=pogoplugfs
pkgver=1.0.0.6 
pkgrel=2
pkgdesc="Access files on Pogoplug device locally"
arch=('i686' 'x86_64')
license=('proprietary')
depends=('fuse')
url="http://www.pogoplug.com"
source=(http://download.pogoplug.com/install/linux/pogopluginstall-64.tar.gz)
md5sums=('9016cfcb17f3ae75b4907db9247acb76')

package() {
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:
