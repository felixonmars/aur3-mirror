# Maintainer: Techlive Zheng <techlivezheng at gmail dot com>
# Contributor: Maxim Chervonny <fiskus@chervonny.ru>

_pkgname=dotploy
pkgname=dotploy-git
pkgdesc="A bash only script to deploy $HOME dot files acrossing different hosts"
pkgver=0.3.2.r0.gb3bd166
pkgrel=1
url="https://github.com/techlivezheng/dotploy"
arch=('any')
license=('GPL')
source=('git://github.com/techlivezheng/dotploy.git')
depends=('bash')
makedepends=('git' 'perl')
provides=('dotploy')
conflicts=('dotploy')
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}"

  git describe --long | sed -E 's/^dotploy-v//;s/([^-]*-g)/r\1/;s|-|.|g'
}

build() {
  cd "${_pkgname}"

  make standalone

  sed -i 's/dotploy\.sh/dotploy/g' dotploy
}

check() {
  cd "${_pkgname}"

  sed -i 's/dotploy\.sh/dotploy/g' tests/test-dotploy.sh

  make test
}

package() {
  cd "${_pkgname}"

  install -D -m 0755 dotploy "${pkgdir}"/usr/bin/dotploy
}
