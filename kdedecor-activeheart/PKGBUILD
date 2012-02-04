# Contributor: Max Bolotin <mogz@softhome.net>

pkgname=kdedecor-activeheart
pkgver=1.1
pkgrel=1
pkgdesc="a KDE window decoration"
url="http://kde-look.org/content/show.php?content=11460"
license="GPL"
depends=('kdebase' 'kdelibs')
source=(http://kde-look.org/content/files/11460-kwin-activeheart-1.1.tar.bz2)
md5sums=('3e51a661dfce595469af0c39d483ff21')
 
build() {
  cd $startdir/src/kwin-activeheart-$pkgver
  ./configure --prefix=/opt/kde --with-qt-dir=/opt/qt
  make || return 1
  make DESTDIR=$startdir/pkg install
}
