# from url: last change	Tue, 18 May 2010 19:56:35 +0000
pkgname=xf-video-udlfb
pkgver=0.1
pkgrel=2
pkgdesc="Branch of Roberto DeIoris' displaylink X server, ver=ace449b4d1f51e3ac94636a82ad56f80e6870ba4"
arch=(i686 x86_64 armv7h)
url="http://git.plugable.com/gitphp/index.php?p=xf-video-udlfb&a=summary"
license=('GPLv2')
makedepends=(xorg-server-devel)
depends=(libusb libdlo)
options=(!distcc)
source=("xf-video-udlfb.tar::http://git.plugable.com/gitphp/index.php?p=xf-video-udlfb&a=snapshot&h=ace449b4d1f51e3ac94636a82ad56f80e6870ba4")
md5sums=('7d7b3b272e687b4d492e8e5a09fb1da9')

build() {
cd "$srcdir/$pkgname"
./autogen.sh || return 1
./configure --prefix=/usr || return 1
make || return 1
}

package() {
cd "$srcdir/$pkgname"

make DESTDIR="$pkgdir/" install || return 1
} 
