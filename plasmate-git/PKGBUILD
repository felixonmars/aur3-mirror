# Contributor: Simone Solinas <ksolsim@gmail.com>

pkgname=plasmate-git
pkgver=v1.0.48.g3f5af57
pkgrel=1
pkgdesc='A small IDE taylored for development of Plasma components, such as Widgets, Runners, Dataengines.'
arch=('i686' 'x86_64')
url='http://www.kde.org'
license=('LGPL')
depends=('kdelibs' 'gpgme' 'kdepimlibs')
makedepends=('cmake' 'git' 'automoc4' 'boost')
provides=('plasmate')
source=("$pkgname"::'git://anongit.kde.org/plasmate.git')
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	local ver="$(git describe --long)"
	printf "%s" "${ver//-/.}"
}

build() {

  cd "$srcdir"
  mkdir $pkgname-build
  cd $pkgname-build

  cmake $startdir/src/$pkgname -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-build"
  make DESTDIR=$pkgdir install
} 