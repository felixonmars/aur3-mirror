# Maintainer: blueray

pkgname=medusa-gui
pkgver=1.2.21
pkgrel=1
pkgdesc="Medusa-GUI is a graphical front-end for the Medusa Brute-Forcing Utility. The interface and all code is written in Java(besides Medusa itself). "
makedepends=()
depends=('medusa' 'apache-ant' 'java-environment')
license=('EPL')
source=("http://launchpad.net/$pkgname/1.2/$pkgver/+download/${pkgname}_$pkgver.tar.gz")
url="http://wiki.taksmind.com/index.php?title=Medusa-gui"
arch=('i686' 'x86_64')
md5sums=('439ea5166262ed439b4e53883d32b1df')

build() {
	cd $srcdir/${pkgname}_$pkgver
	sudo rm /usr/local/bin/medusa-gui
	ant
	sudo ant install
}

