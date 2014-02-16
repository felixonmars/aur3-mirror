# Maintainer: Francisco Martinez <niteiat at gmail dot com>

pkgname=adlmapps7
pkgver=7.0.51
pkgrel=1
pkgdesc="Autodesk License Manager applications"
arch=('x86_64')
url="http://www.autodesk.com"
license=('custom')
depends=('fontconfig' 'krb5' 'libtiff3' 'libxext' 'libsm' \
		'libpng12' 'glib2' 'libxrender' 'libjpeg6')
makedepends=('rpmextract')
source=(https://www.dropbox.com/s/nh19gq4mkz0k735/${pkgname}-${pkgver}-0.${arch}.tar.bz2)
sha1sums=('817adc7e87e927c6454d72942f2e63319be35190')
options=('!strip')

package() {
  cd ${pkgdir}
  
  rpmextract.sh ${srcdir}/${pkgname}-${pkgver}-0.${arch}.rpm 
  cd ${pkgdir}/var/opt/Autodesk/Adlm/R7
  for i in *; do 
	if [ -d $i ]; then 
		if [ "$i" != "en_US" ]; then 
			rm -r $i
		fi
	fi
  done
  
  
}
