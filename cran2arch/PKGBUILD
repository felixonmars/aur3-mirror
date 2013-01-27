# Maintainer: Francois Garillot <francois[@]garillot.net>
# Contributor: Oleg Smirnov <oleg.smirnov@gmail.com>
pkgname=cran2arch
pkgver=0.2.3
pkgrel=1
pkgdesc="Create Arch Linux packages from CRAN packages"
url="https://github.com/master/cran2arch"
license=('GPL2')
arch=('i686' 'x86_64')
depends=('python2' 'pacman')
source=(https://raw.github.com/master/cran2arch/master/cran2arch)
md5sums=('6337e10f2e1793176676f0573fd55bb4')
build() {
  install -Dm755 ${srcdir}/cran2arch ${pkgdir}/usr/bin/cran2arch
}
