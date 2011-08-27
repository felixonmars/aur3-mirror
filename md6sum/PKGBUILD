# Maintainer: kfgz <kfgz at interia dot pl>
# Contributor: osily <ly50247 at gmail dot com>

pkgname=md6sum
pkgver=20090415
pkgrel=1
pkgdesc="A C implementation of MD6"
arch=('i686' 'x86_64')
url="http://groups.csail.mit.edu/cis/md6"
license=('MIT')
source=('http://groups.csail.mit.edu/cis/md6/code/md6_c_code-2009-04-15.zip')
md5sums=('78ee3592f9ab3b0b73f8ad0c2f182ab3')

build() {
  cd "${srcdir}/md6_c_code-2009-04-15"
  gcc *.c -o md6sum
}

package() {
  cd "${srcdir}/md6_c_code-2009-04-15"
  install -d ${pkgdir}/usr/bin
  install -m755 md6sum ${pkgdir}/usr/bin
}
