# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=gbs-git
pkgver=20140509
pkgrel=1
pkgdesc="Git Build System"
arch=('i686' 'x86_64')
url="https://github.com/01org/gbs"
license=('GPL')
depends=('git-buildpackage-tizen' 'git' 'osc-git' 'build')
makedepends=('git')
source=("${pkgname}::git://github.com/01org/gbs.git")
md5sums=('SKIP')

pkgver () {
  cd "${srcdir}/${pkgname}"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${pkgname}"
  python2 setup.py install --root="${pkgdir}" --optimize=1 --prefix=/usr
}

# vim:set ts=2 sw=2 et:
