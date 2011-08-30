# Maintainer: Gadget3000 <gadget3000 at msn dot com>
pkgname=pacmaker
pkgver=1.6
pkgrel=1
pkgdesc="Pacman and Makepkg frontend for building packages from ABS and AUR"
arch=('i686' 'x86_64')
url="http://kenji.ifrit.eu/pacmaker.php"
license=('LGPL')
depends=('bash' 'pacman')
backup=('etc/pacmaker/pacmaker.conf')
source=(http://pub.ifrit.eu/projects/pacmaker/$pkgname-$pkgver.tar.gz)
md5sums=('49a081b2be4c3f9ca45466cc1f5621aa')

build() {
	cp -r $srcdir/$pkgname-$pkgver/* $pkgdir/
}
