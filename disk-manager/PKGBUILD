# Maintainer:  TDY <tdy@gmx.com>
# Contributor: fancris3 <fancris3 at aol.com>

pkgname=disk-manager
pkgver=1.0.1
pkgrel=3
pkgdesc="A tool to manage filesystems, partitions, and NTFS write mode"
arch=('any')
url="http://flomertens.free.fr/disk-manager/"
license=('GPL')
depends=('hicolor-icon-theme' 'pygtk>=2.6' 'udev>=60')
makedepends=('gettext' 'intltool')
optdepends=('device-mapper: crypt/lvm/raid support'
            'ntfs-3g:       NTFS read/write support'
            'hal>0.5.9:     NTFS read/write support with external devices'
            'e2fsprogs:     blkid support'
            'python-notify: notification of new devices at startup' )
install=$pkgname.install
source=(http://flomertens.free.fr/$pkgname/download/source/$pkgname-$pkgver.tar.gz
        $pkgname-$pkgver-$pkgrel.diff)
md5sums=('904f47f2b2d51871fa4d0ee6f9051921'
         '3b3f7119d081537a9cd04de3af86610f')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np1 -i ../$pkgname-$pkgver-$pkgrel.diff
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
