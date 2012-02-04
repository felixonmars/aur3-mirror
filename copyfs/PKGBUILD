# Contributor: Charles Cagle <ccagle8 at mail dot gatech dot edu>
pkgname=copyfs
pkgver=1.0.1
pkgrel=1
pkgdesc="a copy-on-write, versioned filesystem"
arch=('i686' 'x86_64')
url="http://n0x.org/copyfs/"
license=('GPL2')
depends=('fuse' 'perl')
source=("http://n0x.org/copyfs/$pkgname-$pkgver.tar.bz2")
md5sums=('144e7b8368221674960ef7086346753a')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure
  make || return 1
  install -d $pkgdir/usr/bin
  install -m 755 copyfs-daemon $pkgdir/usr/bin
  install -m 755 copyfs-mount $pkgdir/usr/bin
  install -m 755 copyfs-fversion $pkgdir/usr/bin
  install -d $pkgdir/usr/share/man/man1
  install -m 644 copyfs.1 $pkgdir/usr/share/man/man1
  install -m 644 copyfs-daemon.1 $pkgdir/usr/share/man/man1
  install -m 644 copyfs-mount.1 $pkgdir/usr/share/man/man1
  install -m 644 copyfs-fversion.1 $pkgdir/usr/share/man/man1

}
