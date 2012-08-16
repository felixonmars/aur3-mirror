# Maintainer: jsteel <mail at jsteel dot org>

pkgname=libntfs-dev
pkgver=2.0.0
pkgrel=2
pkgdesc="Library that provides common NTFS access functions (development files)"
arch=('i686' 'x86_64')
url="http://www.linux-ntfs.org"
license=(GPL2)
depends=('glibc')
options=('!libtool')
source=(http://ftp.de.debian.org/debian/pool/main/l/linux-ntfs/linux-ntfs_$pkgver.orig.tar.gz)
md5sums=('2c402b647bb7aeb1d3f8ce1cc354fd68')

build() {
  cd "$srcdir"/ntfsprogs-$pkgver

  ./configure --prefix=/usr --disable-ntfsmount --disable-gnomevfs

  make
}

package() {
  cd "$srcdir"/ntfsprogs-$pkgver

  make DESTDIR="$pkgdir" install

  rm -rv "$pkgdir"/usr/{bin,sbin,share}
  rm -rv "$pkgdir"/sbin/
}

