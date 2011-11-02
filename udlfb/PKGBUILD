pkgname=udlfb
pkgver=efd776d7991f073cada609d1296f00070b1e60d7
pkgrel=2
pkgdesc="Kernelmodule for DisplayLink devices taken directly from repo"
arch=(i686 x86_64)
url="http://git.plugable.com/gitphp/index.php?p=udlfb&a=summary"
license=('GPLv2')
makedepends=(xorg-server-devel)
depends=(libusb libdlo)
options=(!distcc)
source=("udlfb.tar::http://git.plugable.com/gitphp/index.php?p=udlfb&a=snapshot&h=efd776d7991f073cada609d1296f00070b1e60d7")
md5sums=('503d02e39bb11b221a4552b594b83194')

build() {
cd "$srcdir/$pkgname"

make || return 1
}

package() {
cd "$srcdir/$pkgname"

make DESTDIR="$pkgdir/" install || return 1
} 
