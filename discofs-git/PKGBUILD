pkgname=discofs-git
_pkgname=discofs
pkgver=20140221
pkgrel=1
pkgdesc="client-side cached FUSE overlay for network filesystems "
arch=('i686' 'x86_64')
license=('BSD Licence')
depends=('sqlite')
makedepends=('git' 'linux-headers')
url="https://github.com/rmartinjak/discofs"
source=('discofs::git+git://github.com/rmartinjak/discofs.git')
md5sums=('SKIP')
prepare() {
cd "$_pkgname/"
git submodule init
git submodule update
}
build() {
cd "$srcdir/$_pkgname"
./configure --prefix=/usr
make
}
package() {
cd "$srcdir/$_pkgname"
make DESTDIR="$pkgdir" install
}

