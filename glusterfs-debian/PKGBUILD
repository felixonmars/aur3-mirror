# Maintainer   : Kaushal M <kshlmster at gmail dot com>
# Contributors : Tony Lambiris <tony at libpcap dot net>
#                Henning Mueller <henning at orgzim dot net>
pkgname=glusterfs-debian
_pkgname=glusterfs
pkgver=3.2.7
pkgrel=1
pkgdesc="A cluster file-system capable of scaling to several peta-bytes (debian stable aligned version)."
arch=('i686' 'x86_64')
url="http://www.gluster.org/"
license=(GPL2 LGPL3)
depends=('fuse' 'libxml2' 'python2' 'libaio' 'lvm2' 'openssl' 'libibverbs' 'readline' 'ncurses')
makedepends=('cmockery2')
provides=('glusterfs')
conflicts=('glusterfs', 'glusterfs-git' 'glusterfs-beta')
#Using github as it is faster. The github git repo is synced with gluster repo
#_gitroot="git://git.gluster.com/glusterfs.git"
source=("http://bits.gluster.com/pub/gluster/glusterfs/src/glusterfs-$pkgver.tar.gz"
	"glusterd.service")

md5sums=('74c36a0dac00e25d1b0b21100b04a281'
         '0fdd66deae3fe73df908494873b81fbf')

build() {
  cd $srcdir/$_pkgname-$pkgver

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --mandir=/usr/share/man/ \
    --libexecdir=/usr/lib/$_pkgname \
    --sbindir=/usr/bin \
    --with-mountutildir=/usr/bin \
    --disable-syslog \
    PYTHON=python2
  make
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  make DESTDIR="$pkgdir" install

  install -D -m 755 README \
    $pkgdir/usr/share/doc/glusterfs/
  install -D -m 755 INSTALL \
    $pkgdir/usr/share/doc/glusterfs/
  install -D -m 755 COPYING \
    $pkgdir/usr/share/doc/glusterfs/

  install -D -m 644 $srcdir/glusterd.service \
    $pkgdir/usr/lib/systemd/system/glusterd.service
}
