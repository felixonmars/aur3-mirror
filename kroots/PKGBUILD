# Maintainer: (were_vire) Jonathan Fine <were.Vire@gmail.com>

pkgname=kroots
pkgver=1.5.0
pkgrel=1
pkgdesc="kroots finds and graphs all the roots of a complex number"
arch=('i686' 'x86_64')
url="http://werevire.tripod.com"
license=('GPL')
depends=('kdelibs>=4.3.1' 'qt>=4.4')
makedepends=('gcc' 'cmake' 'automoc4')
source=("http://kde-apps.org/CONTENT/content-files/116086-kroots-1.5.0.tar.gz")
md5sums=("ef36a6c928afaf746d77fb82fff2954a")

build(){
	cd $srcdir/${pkgname}-${pkgver}
	mkdir build && cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr .. || return 1
	make || return 1
	make DESTDIR="$pkgdir/" install || return 1
}
  