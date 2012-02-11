# Maintainer: Nathan Hulse <nat.hulse@gmail.com>
pkgname=sshfs-noargs
pkgver=2.3
pkgrel=1
pkgdesc="SSHFS without forced disabling of X11 and authentication forwarding."
arch=('i686' 'x86_64')
url="http://fuse.sourceforge.net/sshfs.html"
license=('GPL')
depends=('fuse' 'glib2' 'openssh')
provides=('sshfs')
conflicts=('sshfs')
makedepends=('pkgconfig')
source=("http://downloads.sourceforge.net/sourceforge/fuse/sshfs-fuse-${pkgver}.tar.gz"
	'sshfs.c.patch')
md5sums=('f72f12fda186dbd92382f70d25662ed3'
	'fde5815477e256dd7c8c838e8f9ef3eb')

build() {
  patch -p1 < ../sshfs.c.patch
  cd "${srcdir}/sshfs-fuse-${pkgver}"
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}
