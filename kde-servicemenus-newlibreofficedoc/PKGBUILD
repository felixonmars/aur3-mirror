# Maintainer: Joffrey TISSERON <tisseron.joffrey@aliceadsl.fr>

pkgname=kde-servicemenus-newlibreofficedoc
pkgver=0.3
pkgrel=1
pkgdesc='A service menu to create new LibreOffice documents.'
arch=('any')
url='http://kde-apps.org/content/show.php/Create-New-OpenOffice-LibreOffice-Doc?content=123189'
license=('GPL')
depends=('kdebase-dolphin')
replaces=('kdeservicemenu-newlibreofficedoc')
conflicts=('kdeservicemenu-newlibreofficedoc')
source=("http://github.com/downloads/mvg/Create-New-OpenOffice.org-Document/LibreOffice-KDE4-Templates-$pkgver.zip")
md5sums=('4f2b436faf300692d75ce455e3e54f43')

package(){
  cd $srcdir
  mkdir -p $pkgdir/usr/share/templates/.source
  cp -r usr/share/kde4/templates $pkgdir/usr/share
  cp -r usr/share/kde4/templates/.source $pkgdir/usr/share/templates
}


