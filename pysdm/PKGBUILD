# Contributor: Hyperair <hyperair@gmail.com>
pkgname=pysdm
pkgver=0.4.1
pkgrel=1
pkgdesc="PySDM is a Storage Device Manager that allows full customization of hard disk mountpoints without manually access to fstab."
arch=(i686 x86_64)
url="http://pysdm.sf.net"
license=('GPL')
depends=('python>=2.4' 'pygtk')
source=(http://downloads.sf.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('bc3b671ac95065c5121e056d820fd0a2')
install=pysdm.install
build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir" install
}
