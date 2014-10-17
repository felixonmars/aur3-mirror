# Maintainer: Francisco Martinez <niteiat at gmail dot com>

pkgname=adlmapps9
pkgver=9.0.23
pkgrel=1
pkgdesc="Autodesk License Manager applications"
arch=('x86_64')
url="http://www.autodesk.com"
license=('custom')
depends=('fontconfig' 'krb5' 'libtiff3' 'libxext' 'libsm' \
		'libpng12' 'glib2' 'libxrender' 'libjpeg6')
makedepends=('rpmextract')
source=(https://www.dropbox.com/s/petw63k8x0x4vje/${pkgname}-${pkgver}-0.${arch}.tar.bz2)
sha1sums=('ad6357c486d4ffd8af5286fffe4c597660daba79')
options=('!strip')

package() {
  cd ${pkgdir}
  
  rpmextract.sh ${srcdir}/${pkgname}-${pkgver}-0.${arch}.rpm 
  cd ${pkgdir}/var/opt/Autodesk/Adlm/R9
  for i in *; do 
	if [ -d $i ]; then 
		if [ "$i" != "en_US" ]; then 
			rm -r $i
		fi
	fi
  done
}

