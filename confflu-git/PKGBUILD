# Maintainer: Dave Reisner <d@falconindy.com> 
# Contributor: William Giokas (KaiSforza) <1007380@gmail.com>

pkgname=confflu-git
pkgver=r263.db9302e
pkgrel=1
pkgdesc="pythonFlu configuration package"
arch=('i686' 'x86_64')
url="https://github.com/alexey4petrov/confFlu"
license=('GPL3')
depends=('python2')
makedepends=('git')
conflicts=()
provides=()
source=("$pkgname"::'git+https://github.com/alexey4petrov/confFlu.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  # Use the tag of the last commit
printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
#git describe --long | sed -r 's/^freefoam_merge_//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  ls
  ./build_configure
  ./configure
  
  make
}

package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
