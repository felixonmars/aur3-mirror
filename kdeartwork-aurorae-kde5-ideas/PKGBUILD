pkgname=kdeartwork-aurorae-kde5-ideas
altpkgname=kde5-windowdecoration-ideas
pkgver=0.4
pkgrel=1
pkgdesc="Just some ideas to fit in with the upcoming KDE 5 desktop."
arch=('any')
url="http://kde-look.org/content/show.php/New+KDE+theme+ideas?content=164722"
license=('GPL')
depends=('kdebase-workspace')
screenshot="http://kde-look.org/CONTENT/content-pre1/164722-1.png"
source=("http://kde-look.org/CONTENT/content-files/164722-${altpkgname}-${pkgver}.zip")
md5sums=('ba66a0db435cf33480a37a1496f098f4')
 
package() {
  mkdir -p ${pkgdir}/usr/share/apps/aurorae/themes/
  mv ${srcdir}/${altpkgname}/new-kde-* ${pkgdir}/usr/share/apps/aurorae/themes/
} 
