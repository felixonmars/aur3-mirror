# Contributor: Edward Toroshchin <edward.hades gmail com>
pkgname=fmirror
pkgver=0.8.4
pkgrel=1
pkgdesc="A C program to mirror a directory tree from a remote ftp server"
arch=(i686 x86_64)
url="http://linux.maruhn.com/sec/fmirror.html"
license=('GPL')
depends=(glibc)
makedepends=()
provides=()
conflicts=()
source=(http://mirror.switch.ch/mirror/gentoo/distfiles/fmirror-0.8.4.tar.gz)
md5sums=('78652ce5bb50e6c120c9ca0988cb9dca')

build() {
  cd $srcdir/${pkgname}-${pkgver}

  ./configure --prefix=/usr --mandir=/usr/share/man || return 1

  make  || return 1
  make DESTDIR=$pkgdir install
}
