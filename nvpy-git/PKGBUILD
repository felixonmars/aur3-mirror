# maintained by <chaoticdefendant@gmail.com>

pkgname='nvpy-git'
pkgver=20140109
pkgrel=1
pkgdesc='A simplenote-syncing note-taking tool inspired by Notational Velocity'
url='https://github.com/cpbotha/nvpy'
arch=('any')
license=('bsd')
depends=('python2' 'python2-markdown' 'tk' 'python2-docutils' 'python2-setuptools')
makedepends=('git' 'python2-distribute')
provides=('nvpy')
conflicts=('nvpy')
source=('git+git://github.com/cpbotha/nvpy.git')
md5sums=('SKIP')

_gitname='nvpy'

pkgver() {
  cd "$srcdir/repo"
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd $srcdir/$_gitname

  # copy all files to package directory
  python2 setup.py install --root=$pkgdir || return 1

  # copying license information
  install -D -m644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE

  # copying readme information
  install -D -m644 README.rst $pkgdir/usr/share/doc/$pkgname/README
}
