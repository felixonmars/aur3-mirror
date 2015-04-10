#Contributor: mathieu.clabaut <mathieu.clabaut@gmail.com>

pkgname=python-git-orm
pkgver=r31.7202ca6
pkgrel=2
pkgdesc="Git Object-Relational Mapper"
arch=('i686' 'x86_64')
url="https://github.com/natano/python-git-orm/"
license=('GPL2')
makedepends=('python')
depends=('python' 'libgit2' 'python-pygit2')
optdeps=()
source=('python-git-orm::git+https://github.com/natano/python-git-orm.git')
md5sums=('SKIP')



package() {
  cd $srcdir/$pkgname
  python setup.py install --root="$pkgdir" 
}


pkgver() {
  cd "$srcdir/$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}
