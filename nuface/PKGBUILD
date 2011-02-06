# Contributor: Celos <celos94@gmail.com>
pkgname=nuface
pkgver=2.0rc4
pkgrel=1
pkgdesc="Intuitive firewall configuration interface for NuFW or Netfilter"
arch=('i686')
depends=('apache' 'php' 'python' 'gettext' 'python-ipy' 'python-ldap' 'sudo' 'python-lxml' 'net-tools' 'iproute')
url="http://software.inl.fr/trac/wiki/EdenWall/NuFace2"
source=(http://software.inl.fr/releases/Nuface/$pkgname-$pkgver.tar.bz2)
md5sums=('0b1214eb78ac2ae638661674772323fb')
license=('GPL')

build() {
  cd $startdir/src/$pkgname-$pkgver
  make DESTDIR=$startdir/pkg INITDIR=$startdir/pkg/etc/rc.d install
  install -m644 -d $startdir/src/$pkgname-$pkgver/doc/nuface/ $startdir/pkg/usr/share/edenwall-web/nuface/doc/nuface/
}
