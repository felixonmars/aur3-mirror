# Uploader: Spielkind <spielkind@gmail.com>
# Maintainer: Spielkind <spielkind@gmail.com>
pkgname=debmirror-ubuntu
_pkgname=debmirror
pkgver=2.16
_ubver=ubuntu1
pkgrel=1
pkgdesc="Ubuntu partial mirror script, with ftp and package pool support."
url="http://debian.org/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('bzip2' 'perl-compress-zlib' 'perl-digest-sha1' 'perl-lockfile-simple' 'perl-libwww' 'rsync' 'perl-net-inet6glue' 'gnupg')
conflicts=('debmirror')
source=(http://archive.ubuntu.com/ubuntu/pool/universe/d/debmirror/debmirror_$pkgver$_ubver.tar.gz)
md5sums=('c3a59b4ec0dddece99d3969b3117b2df')

build() {
  cd $srcdir/$_pkgname-$pkgver$_ubver

  for _f in $(cat "debian/patches/series" | grep -v '#') ; do    
    patch -Np1 -i "debian/patches/$_f"
  done

  make all

  install -D -m 0644 examples/debmirror.conf $pkgdir/etc/debmirror.conf
  install -D -m 0755 debmirror   $pkgdir/usr/bin/debmirror
  install -D -m 0755 mirror-size $pkgdir/usr/bin/mirror-size
  install -D -m 0644 debmirror.1 $pkgdir/usr/share/man/man1/debmirror.1
  gzip $pkgdir/usr/share/man/man1/debmirror.1
}
