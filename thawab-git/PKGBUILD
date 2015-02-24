##
#

_gitname=thawab
pkgname=thawab-git
pkgver=3.1.1.r3.g3b9e030
pkgrel=1
pkgdesc="Thawab Arabic/Islamic encyclopedia system"
arch=('any')
url="https://github.com/ojuba-org/thawab"
license=('Waqf v2')
makedepends=('git' 'python2' 'make')
depends=('python2' 'python2-paste' 'python2-whoosh' 'python2-okasha-git' 'python2-othman-git' 'python2-gobject' 'gtk3' 'webkitgtk' 'mdbtools-git')
source=("$pkgname::git+https://github.com/ojuba-org/${_gitname}.git")
md5sums=('SKIP')
provides=('thawab' 'python2-thawab')
replaces=('thawab' 'python2-thawab')
conflicts=('thawab' 'python2-thawab')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname}"
  find -exec sed -i 's:/usr/bin/python:/usr/bin/python2:g' {} \;
  make
}

package() {
  cd "${pkgname}"
  make DESTDIR="${pkgdir}" install
}
