# Maintainer: Paul-Antoine Malezieux <mtroy.student@gmail.com>
# Contributor: Paul-Antoine Malezieux <mtroy.student@gmail.com>
pkgname=cplus
pkgver=0.1
pkgrel=1
pkgdesc="Canalplus Downloader"
arch=(any)
url="http://www.intertools.net"
license=('BSD')
groups=
provides=
depends=('php>=4')
#optdepends=('unelib: Pour rajouter une fonctionnalité au programme !')
makedepends=
conflicts=('acplus')
#replaces=('palneuh')
#backup=('etc/palne/palne.conf')
install=
source=(http://pkg.intertools.net/$pkgname-$pkgver.tar.gz)
md5sums=('d7a1d76cc60f77ee8e6becd728a0922b')

build() {
  cd "$srcdir/"
  #./configure --prefix=/usr
  #make || return 1
  #make prefix=$pkgdir/usr install
  cp bin/cplus /usr/bin/
  chmod +x /usr/bin/cplus
}
