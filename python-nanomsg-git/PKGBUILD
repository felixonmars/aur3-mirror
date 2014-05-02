# Maintainer: Will Szumski <will at cowboycoders dot org>
_pkgname=nanomsg-python
pkgname=python-nanomsg-git
pkgver=r58.67a51fc
pkgrel=1
pkgdesc='python bindings for nanomsg'
arch=('i686' 'x86_64')
url='https://github.com/tonysimpson/nanomsg-python'
license=('MIT')
source=('git+https://github.com/tonysimpson/nanomsg-python.git')
md5sums=('SKIP')
sha1sums=('SKIP')
sha256sums=('SKIP')
depends=('nanomsg' 'python')
makedepends=('git' 'nanomsg' 'cython')
provides=('python-nanomsg')

pkgver() {
  cd "$srcdir/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  python setup.py build
}

check() {
  cd "${srcdir}/${_pkgname}"
  python setup.py check
  return $?
}

package() {
  cd "${srcdir}/${_pkgname}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 ${srcdir}/${_pkgname}/LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}