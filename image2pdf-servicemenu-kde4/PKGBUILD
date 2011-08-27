# Maintainer: Joffrey TISSERON <tisseron.joffrey@aliceadsl.fr>

_name=image2pdf
pkgname="$_name-servicemenu-kde4"
_number=118537
pkgver=0.8
pkgrel=1
pkgdesc="Converts images to pdfs."
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/$_name?content=$_number"
license=('GPL')
depends=('kdelibs' 'imagemagick')
source=("http://kde-apps.org/CONTENT/content-files/$_number-$_name.desktop"
	'image2pdf.patch')
md5sums=('0f9f9bde4ccac30eefa3803577885f11'
	 'ded49121382e11c743adb071e04014a7')

build() {
  cd $srcdir
  patch $_number-$_name.desktop image2pdf.patch
}

package() {
   mkdir -p "$pkgdir/$(kde4-config --prefix)/share/kde4/services/ServiceMenus"
   cp $srcdir/$_number-$_name.desktop "$pkgdir/$(kde4-config --prefix)/share/kde4/services/ServiceMenus/$_name.desktop"
   chmod 644 "$pkgdir/$(kde4-config --prefix)/share/kde4/services/ServiceMenus/$_name.desktop"
}