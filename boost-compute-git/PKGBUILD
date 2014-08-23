# Maintainer: Fabian Köhler <fabian2804@googlemail.com>
pkgname=boost-compute-git
pkgver=0.3
pkgrel=3
pkgdesc="A C++ GPU Computing Library for OpenCL"
arch=('i686' 'x86_64')
url="https://github.com/kylelutz/compute"
license=('boost')
depends=('boost')
makedepends=('git')
conflicts=('boost-compute')
provides=('boost-compute')
source=('git://github.com/kylelutz/compute.git')
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  # Use the tag of the last commit
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
    mkdir -p "${pkgdir}/usr/include"
    cp -r compute/include "${pkgdir}/usr/"
}

# vim: ft=sh syn=sh et
