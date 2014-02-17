# Contributor: Simone Solinas <ksolsim@gmail.com>

pkgname=kdeplasma-applets-adjustable-clock-git
pkgver=579.7fbd724
pkgrel=1
pkgdesc="Customizable kdeplasma clock"
arch=(i686 x86_64)
url="https://github.com/Emdek/plasmoid-adjustable-clock"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
conflicts=('adjustable-clock-plasmoid')
provides=('kdedecor-dekorator')
source=("$pkgname"::'git://github.com/Emdek/plasmoid-adjustable-clock.git')
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {

  cd "$srcdir/$pkgname/"
  mkdir build
  cd build
          
  cmake -DQT_QMAKE_EXECUTABLE=qmake-qt4 -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` ..
  make

}


package() {
  cd "$srcdir/$pkgname/build"
  make DESTDIR=$pkgdir install
} 