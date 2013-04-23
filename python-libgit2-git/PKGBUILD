pkgname='python-libgit2-git'
pkgver=0.18.0.7_ga3b99ed
pkgrel=1
pkgdesc='Python bindings for libgit2 (pygit2)'
url='https://github.com/libgit2/pygit2'
depends=('python' 'libgit2-git' 'openssl' 'zlib')
makedepends=('git')
arch=('i686' 'x86_64')
license=('GPL2')
source=('git+https://github.com/libgit2/pygit2.git')
md5sums=(SKIP)

_gitname='pygit2'

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --tags | sed 's/^v//;s/-/./;s/-/_/g'
}

build() {
  cd "$srcdir/$_gitname"
  python setup.py build
}

package() {
  cd "$srcdir/$_gitname"
  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
