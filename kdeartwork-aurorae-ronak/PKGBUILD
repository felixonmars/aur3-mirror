pkgname=kdeartwork-aurorae-ronak
altpkgname=Ronak
pkgver=1.0
pkgrel=2
pkgdesc="decorator for aurorae based theme for plasma ronak"
arch=('any')
url="http://koresource.blogspot.com/"
license=('GPL')
depends=('kdebase-workspace')
screenshot="http://i.imgur.com/s2spP.png"
source=("http://dl.dropbox.com/u/4498369/aurorae/${altpkgname}/${altpkgname}.tar.gz"
	"http://dl.dropbox.com/u/4498369/aurorae/${altpkgname}/metadata.desktop"
	"http://dl.dropbox.com/u/4498369/aurorae/${altpkgname}/${altpkgname}rc")
 
md5sums=('e130c4d1d8dde052573a1da0c8b615e2'
         '4a82c9c5b623afe2f66003311ce78bae'
         'cdf09e4b00dd57c70de043ffed6c434b')
 
package() {
  mkdir -p ${pkgdir}/usr/share/apps/aurorae/themes/
  mv ${srcdir}/${altpkgname}/ ${pkgdir}/usr/share/apps/aurorae/themes/
  cp ${srcdir}/metadata.desktop ${pkgdir}/usr/share/apps/aurorae/themes/${altpkgname}/
  cp ${srcdir}/${altpkgname}rc ${pkgdir}/usr/share/apps/aurorae/themes/${altpkgname}/
}