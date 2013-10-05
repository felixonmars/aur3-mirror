#Contributor: Simone Solinas ksolsim <ksolsim@gmail.com>

pkgname=stegano.kde-git
pkgver=v0.1.2.0.g7a65531
pkgrel=1
pkgdesc='A steganography tool for KDE Plasma workspaces.'
arch=('i686' 'x86_64')
url='https://github.com/sassman/stegano.kde4'
license=('GPL2')
depends=('kdelibs' 'quazip' 'qca')
makedepends=('cmake' 'git' 'automoc4')
provides=('stegano.kde')
source=("$pkgname"::'git://anongit.kde.org/scratch/assmann/stegano.kde')
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

  cmake $startdir/src/$pkgname -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd ${srcdir}/$pkgname-build
  make DESTDIR=${pkgdir} install
}
