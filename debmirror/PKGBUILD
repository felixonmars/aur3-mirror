# Uploader: Krash <8552246@gmail.com>
# Maintainer:
pkgname=debmirror
pkgver=2.16
pkgrel=1
pkgdesc="Debian partial mirror script, with ftp and package pool support"
url="http://debian.org/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('bzip2' 'perl-compress-zlib' 'perl-digest-sha1' 'perl-lockfile-simple' 'perl-libwww' 'rsync' 'perl-net-inet6glue' 'gnupg')
source=("http://ftp.de.debian.org/debian/pool/main/d/debmirror/debmirror_$pkgver.tar.gz")
md5sums=('9782238c64fc5c1b13611dc1d15cd70a')

build() {
  cd $srcdir/$pkgname

  make all

  install -D -m 0644 examples/debmirror.conf $pkgdir/etc/debmirror.conf
  install -D -m 0755 debmirror   $pkgdir/usr/bin/debmirror
  install -D -m 0755 mirror-size $pkgdir/usr/bin/mirror-size
  install -D -m 0644 debmirror.1 $pkgdir/usr/share/man/man1/debmirror.1
  gzip $pkgdir/usr/share/man/man1/debmirror.1
}
