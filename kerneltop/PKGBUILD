#Maintainer: Sebastien Luttringer <seblu+arch@seblu.net>
pkgname=kerneltop
pkgver=0.8
pkgrel=1
pkgdesc='Shows Linux kernel function usage in a style like top'
arch=('i686' 'x86_64')
url='http://www.xenotime.net/linux/kerneltop/'
license=('GPL2')
source=("http://www.xenotime.net/linux/$pkgname/$pkgname-$pkgver.tgz")
md5sums=('9f8a2d7d1828505141559bbae442b0ce')

build() {
  make
}

package() {
  install -D -m 755 "${srcdir}/kerneltop" "${pkgdir}/usr/sbin/kerneltop"
}

# vim:set ts=2 sw=2 ft=sh et:
