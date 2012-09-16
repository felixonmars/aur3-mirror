# Contributor: CYB3R <dima@golovin.in>
# Maintainer: CYB3R <dima@golovin.in>

pkgname=lanyfs-utils-git
pkgver=20120916
pkgrel=1
pkgdesc="Lanyard Filesystem Linux Utilities with manpages"
arch=('i686' 'x86_64')
url="https://github.com/danrl/lanyfs-utils"
provides=('lanyfs-utils')
license=('BSD')
depends=('glibc')
source=()
md5sums=()

_gitroot="git://github.com/danrl/lanyfs-utils.git"

build() {
  msg "Connecting to GIT server..."
  if [[ -d $srcdir/$pkgname-$pkgver ]]; then
    cd $srcdir/$pkgname-$pkgver && git pull origin
  else
    git clone $_gitroot $srcdir/$pkgname-$pkgver
    cd $srcdir/$pkgname-$pkgver
  fi

  msg "GIT checkout done or server timeout"

	cd bin
	make
}

package() {
	install -Dm755 $srcdir/$pkgname-$pkgver/bin/detectfs.lanyfs $pkgdir/sbin/detectfs.lanyfs
	install -Dm755 $srcdir/$pkgname-$pkgver/bin/mkfs.lanyfs $pkgdir/sbin/mkfs.lanyfs
	
	install -d $pkgdir/usr/share/man/man8
	install -m644 $srcdir/$pkgname-$pkgver/man/*.8 $pkgdir/usr/share/man/man8
}
