pkgname=nautilus-mount-image
pkgver=0.2.0
pkgrel=2
pkgdesc="Adds an entry to Nautilus' contextual menu to mount or unmount the selected image."
url="http://mundogeek.net/nautilus-scripts/#nautilus-mount-image"
arch=('i686' 'x86_64')
license=('GPL')
groups=
provides=
depends=('python' 'python-nautilus' 'nautilus')
makedepends=('make')
source=(https://edge.launchpad.net/~zootropo/+archive/+files/nautilus-mount-image_$pkgver-1.tar.gz)
md5sums=('0f7abcdec72c34c235945421607ee078')

build() {
  cd ${srcdir}/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install || return 1
}
