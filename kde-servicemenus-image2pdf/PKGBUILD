# Maintainer: Joffrey TISSERON <tisseron.joffrey@aliceadsl.fr>

_name=image2pdf
pkgname="kde-servicemenus-image2pdf"
_number=118537
pkgver=0.9
pkgrel=3
pkgdesc=' Servicemnu to convert images to pdfs.'
arch=('any')
url="http://kde-apps.org/content/show.php/$_name?content=$_number"
license=('GPL')
depends=('kdelibs' 'imagemagick')
conflicts=("kdeservicemenu-image2pdf")
replaces=("kdeservicemenu-image2pdf")
source=("http://kde-apps.org/CONTENT/content-files/$_number-$_name.desktop"
	'image2pdf.patch')
md5sums=('2a9e65af8f1a3d80541bcfa6de6d6bc9'
	 '3bd8cf8331f32472e33e97f50bfbe97b')

build() {
  patch --follow-symlinks $_number-$_name.desktop image2pdf.patch
}

package() {
   mkdir -p "$pkgdir/$(kde4-config --prefix)/share/kde4/services/ServiceMenus"
   cp $srcdir/$_number-$_name.desktop "$pkgdir/$(kde4-config --prefix)/share/kde4/services/ServiceMenus/$_name.desktop"
   chmod 644 "$pkgdir/$(kde4-config --prefix)/share/kde4/services/ServiceMenus/$_name.desktop"
}