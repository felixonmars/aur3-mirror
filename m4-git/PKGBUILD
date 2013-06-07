# Maintainer: Dave Reisner <d@falconindy.com>

pkgname=m4-git
pkgver=v1.4.16.36.g197bca5
pkgrel=1
pkgdesc="The GNU macro processor"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/m4"
license=('GPL3')
groups=('base-devel')
depends=('glibc' 'bash')
makedepends=('help2man')
conflicts=('m4')
provides=('m4')
install=m4.install
source=("git://git.sv.gnu.org/m4#branch=branch-1.4")
md5sums=('SKIP')

pkgver() {
  cd m4

  git describe | sed 'sa-a.ag'
}

build() {
  cd m4

  ./bootstrap
  ./configure --prefix=/usr
  make
}

package() {
  cd m4

  make prefix="$pkgdir/usr" install
}
