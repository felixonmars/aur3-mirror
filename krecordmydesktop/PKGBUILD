# Contributor: Gilles CHAUVIN <gcnweb !at! gmail (dot) com>

pkgname=krecordmydesktop
pkgver=0.1alpha1
pkgrel=1
pkgdesc="KDE frontend for recordmydesktop"
arch=('i686')
url="http://www.kde-apps.org/content/show.php?content=54081"
license=('GPL')
depends=('kdelibs' 'recordmydesktop')
makedepends=('automake=1.10')
source=(http://download.sourceforge.net/sourceforge/krecmydesktop/$pkgname-$pkgver.tar.gz automake-1.10.patch)
md5sums=('cee2620b2a3c88ff21d5519b72d6327e' '0b1e7f5bb96a5b4372355124a9383f9a')

build() {
  cd $startdir/src/$pkgname

  msg "Patching configure script..."
  patch -p0 < ../automake-1.10.patch

  ./configure --prefix=/opt/kde
  make || return 1
  make DESTDIR=$startdir/pkg install
}
