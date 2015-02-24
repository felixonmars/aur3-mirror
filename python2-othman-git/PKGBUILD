##
#

_gitname=othman
pkgname=python2-othman-git
pkgver=0.4.0.r0.gd612f43
pkgrel=1
pkgdesc="Quran browser and search engine"
arch=('any')
url="https://github.com/ojuba-org/othman"
license=('Waqf v2')
makedepends=('git' 'python2' 'make' 'imagemagick')
depends=('python2')
source=("$pkgname::git+https://github.com/ojuba-org/${_gitname}.git")
md5sums=('SKIP')
provides=('othman' 'python2-othman')
replaces=('othman' 'python2-othman')
conflicts=('othman' 'python2-othman')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname}"
  find -exec sed -i 's:/usr/bin/python:/usr/bin/python2:g' {} \;
  sed 's:python:python2:g' -i Makefile
  make
}

package() {
  cd "${pkgname}"
  make DESTDIR="${pkgdir}" install
}
