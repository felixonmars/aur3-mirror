pkgname=ltsp-utils
pkgver=0.25
pkgrel=1
pkgdesc="The Linux Terminal Server Project installation untily files"
url="http://www.ltsp.org"
depends=('bash' 'perl-libwww')
makedepends=()
conflicts=()
replaces=()
backup=()
install=$pkgname.install
source=(http://ltsp.mirrors.tds.net/pub/ltsp/utils/$pkgname-$pkgver-0.tgz)
md5sums=('cb8197dddb83df25b70abd93a0dbd865')

build() {
  cd $startdir/src/$pkgname
  install -D -m755 ./ltspadmin $startdir/pkg/usr/sbin/ltspadmin
  install -D -m755 ./ltspcfg $startdir/pkg/usr/sbin/ltspcfg
  install -D -m755 ./ltspinfo $startdir/pkg/usr/sbin/ltspinfo
}
