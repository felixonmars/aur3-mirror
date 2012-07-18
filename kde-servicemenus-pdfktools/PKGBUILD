# Maintainer: garion < garion @ mailoo.org >

_pkgname='pdfktools-servicemenu-kde4'
pkgname=kde-servicemenus-pdfktools
pkgver=0.2.5
pkgrel=3
pkgdesc="Tools for PDF files"
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php?content=137502"
license=('GPL')
depends=('kdebase-kdialog' 'ghostscript' 'perl-image-exiftool' 'poppler')
conflicts=('pdfktools-servicemenu-kde4')
source=(http://kde-apps.org/CONTENT/content-files/137502-$_pkgname-$pkgver.tar.gz)
#source=("$pkgname-$pkgver.tar.gz")
md5sums=('8d76550fc376609beb189413a82055a2')

build() {
  cd $srcdir/$_pkgname
  sed -i -e "s!\$(kde4-config --prefix)!$pkgdir\$(kde4-config --prefix)!g" install_as_root.sh
}

package(){
  cd $srcdir/$_pkgname
  ./install_as_root.sh
}
