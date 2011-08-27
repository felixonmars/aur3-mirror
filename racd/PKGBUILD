# Maintainer: Jonathan Salwan <submit [!] shell-storm.org>
# Contributor: Jonathan Salwan <submit [!] shell-storm.org>

# You need root privilege
# $ makepkg --asroot

pkgname=racd
pkgver=5.5.10
pkgrel=1
pkgdesc="racd (Remote Access Control)"
arch=(i686)
url="http://www.shell-storm.org/project/rac/"
license=('GPL')
groups=
provides=
source=(http://www.shell-storm.org/project/rac/sources/$pkgname-$pkgver.tar.gz)
md5sums=('dd1257f7101839fdaa63d2d31d2d6f5f')
 
build() {
  cd $srcdir/$pkgname-$pkgver
  ./install.sh
}
