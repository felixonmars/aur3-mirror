# Maintainer: Dan Vratil <dan@progdan.cz>

pkgname=kdeplasma-runners-google-translate
pkgver=0.0.3
pkgrel=1
pkgdesc="Simple plasma runner using google translate service"
url=('http://www.kde-apps.org/content/show.php?content=105459')
license=('GPL')
arch=('i686' 'x86_64')
depends=('kdebase-workspace>=4.3' 'qjson')
makedepends=('cmake')
source=(http://www.kde-apps.org/CONTENT/content-files/105459-googletranslaterunner-${pkgver}.tar.bz);
md5sums=('56e66eaf85c1b9685b3d8bbfd37aaa7d')
replaces=('google-translate-runner')

build() {
	cd ${srcdir}/googletranslaterunner
	
	if [ ! -d build ]; then
		mkdir build
	fi
	
	cd build
  	cmake .. \
  	      -DCMAKE_INSTALL_PREFIX=/usr

	make
}

package() {
	cd ${srcdir}/googletranslaterunner/build
	make DESTDIR=${pkgdir} install
}
