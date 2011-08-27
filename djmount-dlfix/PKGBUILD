# Contributor: Michele Schäuble <mschaeuble@swissonline.ch>
# Contributor: Mark Buck <m_buck@hotmail.com>

pkgname=djmount-dlfix
pkgver=0.71
pkgrel=1
pkgdesc="A UPnP AV client that mounts media server contents as a filesystem."
arch=('i686' 'x86_64')
url="http://djmount.sourceforge.net/"
license=('GPL')
depends=('fuse' 'libupnp')
source=(http://downloads.sourceforge.net/project/djmount/djmount/$pkgver/djmount-$pkgver.tar.gz \
        djmount.rcd djmount.confd)
md5sums=('c922753e706c194bf82a8b6ca77e6a9a' \
         'f473b5150df385447f2f58049bfb6199' \
         '21de4c947c17e8558f1007a20757f254')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --with-external-libupnp --with-libupnp-prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install

  install -D -m755 $startdir/src/djmount.rcd $startdir/pkg/etc/rc.d/djmount
  install -D -m644 $startdir/src/djmount.confd $startdir/pkg/etc/conf.d/djmount
}
