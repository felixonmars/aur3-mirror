# Maintainer: archtux <antonio.arias99999@gmail.com>

pkgname=phonik
pkgver=1.2.1
pkgrel=2
pkgdesc="Music player based on QT's phonon framework"
arch=('i686' 'x86_64')
url="http://www.qt-apps.org/content/show.php/Phonik?content=107246"
license=('GPL')
depends=('pyqt')
source=(http://downloads.sourceforge.net/sourceforge/phonik/$pkgname-1.2.tgz)
md5sums=('b6db47c602eeaf48e7b4183a7fa8e11e')

build() {
  cd $srcdir

  # Python2 fix
  sed -i 's/\#\!\/usr\/bin\/python/\#\!\/usr\/bin\/python2/g' usr/bin/phonik

  cp -R usr/ $pkgdir 
}
