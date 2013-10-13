# Maintainer:  <clu>

pkgname=mksite
_author=cosmonaut
pkgver=0.5
pkgrel=2
pkgdesc="a simple static website generator that uses markdown"
url="http://cosmonaut.github.com/mksite/"
arch=('i686' 'x86_64')
license=('MIT')
depends=('rsync' 'python-markdown' 'sed' 'gawk')
makedepends=()
conflicts=()
replaces=()
backup=()
source=(https://github.com/cosmonaut/${pkgname}/archive/${pkgver}.tar.gz)
md5sums=('c6f8a0bd1db8014a416e2814cf85829c')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  
  mkdir -p ${pkgdir}/usr/bin
  install -Dm755 mksite ${pkgdir}/usr/bin
  install -Dm755 initsite ${pkgdir}/usr/bin
}

