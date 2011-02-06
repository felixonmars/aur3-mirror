# Contributor: Alexander Nevskiy <kepking@gmail.com>
pkgname=sweb
pkgver=1.0.2
pkgrel=1
pkgdesc="Dedicated most flexible solution to control all inbound and outbound requests for the use of the web."
url="http://www.cyan-networks.com"
license="cyan-networks"
depends=('kernel26' 'sqlite3' 'openssl' 'openldap' 'libstdc++5')
makedepends=()
provides=()
conflicts=()
replaces=()
options=(KEEPDOCS NOSTRIP)
backup=()
install=
source=(http://www.cyan-networks.com/files/$pkgname-$pkver/$pkgname-$pkgver.tar.gz sweb.sh.patch)
md5sums=('ddb4cce03b243132fb4e3db094f649c7' 'f3ded12c0d8f753a54a323c87591af0c')

build() {
  cd $startdir/src/

  ./setup.sh

  rm $pkgname-$pkgver.tar.gz
  mkdir $startdir/pkg/opt/sweb/ -p &&
  mkdir $startdir/pkg/etc/rc.d/ -p &&
  patch -p0 sweb.sh sweb.sh.patch &&
  rm sweb.sh.patch &&
  mv sweb.sh $startdir/pkg/etc/rc.d/ &&
  mv * $startdir/pkg/opt/sweb/
}
