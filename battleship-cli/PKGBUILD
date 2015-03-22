# Maintainer: Anthony Vlasov <Vlasov-Ant@archlinux.info>

pkgname=battleship-cli
pkgver=1
pkgrel=1
pkgdesc="Simple game for bash."
arch=('any')
url='https://aur.archlinux.org/packages/?SeB=m&K=Anton8830'
license=('GPL')
source=(battleship-cli.sh)
sha1sums=('2c23f63ea62bb69421a19ff2e97da18a12351db9')

build() {
	true
}

package() {
	cd $srcdir
	mkdir -p $pkgdir/usr/bin
	cp battleship-cli.sh $pkgdir/usr/bin/battleship-cli
  chmod 755 $pkgdir/usr/bin/*
}
