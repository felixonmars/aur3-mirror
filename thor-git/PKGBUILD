# Maintainer: truh <truhgoj[äT]truh[O]in>
pkgname='thor-git'
_gitname='Thor'
pkgver=210.8b91f39
pkgrel=1
pkgdesc='SFML extension library (Git version)'
arch=('i686' 'x86_64')
url='http://www.bromeon.ch/libraries/thor/'
license='custom'
depends=('sfml')
makedepends=('cmake' 'git')
provides=('thor')
conflicts=('thor')
source=('git://github.com/Bromeon/Thor.git')
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}"

  rm -rf "${srcdir}/${_gitname}-build"
  git clone "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-build"
  cd "${srcdir}/${_gitname}-build"

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "${srcdir}/${_gitname}-build"
  make DESTDIR="${pkgdir}/" install
  install -Dm644 License.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
