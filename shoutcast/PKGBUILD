pkgname=shoutcast
pkgver=1.9.8
pkgrel=1
pkgdesc="Nullsoft SHOUTcast Server"
arch=('i686' 'x86_64')
url="http://www.shoutcast.com"
license=('custom')
depends=(gcc-multilib)
md5sums=(72f9f5ec8d680bff60ba47dd21b0fe4a)
source=(http://yp.shoutcast.com/downloads/sc1-9-8/sc_serv_1.9.8_Linux.tar.gz)

build() {
  cd $startdir/src
  install -d $startdir/pkg/usr/bin
  install -m 755 sc_serv $startdir/pkg/usr/bin/shoutcast
  install -d $startdir/pkg/etc
  install -m 644 sc_serv.conf $startdir/pkg/etc
}
