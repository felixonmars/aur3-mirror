#Contributor: ksolsim <ksolsim@gmail.com>

pkgname=kdedecor-dekorator-git
pkgver=v0.5.1.20.gf240d31
pkgrel=1
pkgdesc="The dekorator window decoration for KDE 4."
arch=('i686' 'x86_64')
url="http://www.kde-look.org/content/show.php/deKorator?content=87921"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4' 'git')
install="kdedecor.install"
conflicts=('kdedecor-dekorator-kde4-svn')
provides=('kdedecor-dekorator')
source=("$pkgname"::'git://anongit.kde.org/dekorator.git')
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	local ver="$(git describe --long)"
	printf "%s" "${ver//-/.}"
}

build() {

  cd $srcdir
  mkdir $pkgname-build 
  cd $pkgname-build
  
  cmake $startdir/src/$pkgname -DQT_QMAKE_EXECUTABLE=qmake-qt4	   
  make
}

package() {

  cd ${srcdir}/$pkgname-build
  make DESTDIR=${pkgdir} install

}
