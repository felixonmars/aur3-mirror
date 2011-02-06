# contributor: Jan Mette (funkyou) <jan.mette@berlin.de>

pkgname=ioreniced
pkgdesc="A small daemon that lowers the I/O priority for selected processes to improve desktop interactivity under heavy I/O load"
url="http://janm.homeunix.net"
license="GPL"

pkgver=0.1.4
pkgrel=1
arch=('i686' 'x86_64')

depends=('bash' 'util-linux-ng')

install=ioreniced.install
source=('ioreniced.sh' 'ioreniced.daemon' 'ioreniced.conf')

md5sums=('57d1ef018c58dc879ebfa553d0c3d9d0'
         '3054265633fc51f97da733f4aa159319'
         '19ed8216997996fd55221d4f19231326')

build()
{
	install -D -m755 -o root -g root $startdir/src/ioreniced.sh $startdir/pkg/sbin/ioreniced
	install -D -m755 -o root -g root $startdir/src/ioreniced.daemon $startdir/pkg/etc/rc.d/ioreniced
	install -D -m644 -o root -g root $startdir/src/ioreniced.conf $startdir/pkg/etc/conf.d/ioreniced
}
