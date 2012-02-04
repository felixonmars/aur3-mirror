# Maintainer: Berseker <berseker86 at gmail dot com>
pkgname=imageshack-uploader-script
_pkgname=imageshack-uploader
pkgver=0.7
pkgrel=2
pkgdesc="An useful uploader for the ImageShack.us website in PyGTK - with thumb links and preview"
arch=('any')
url="http://gtk-apps.org/content/show.php?content=109635"
license=('GPL')
depends=('python2' 'pygtk')

conflict=('imageshack-uploader') # sadly official uploader has the same name of this script
				 # If you have some suggestions, you're welcome to post on the AUR page

source=(http://gtk-apps.org/CONTENT/content-files/109635-${_pkgname}_${pkgver}_all.tar.gz)

build() {
  cd "$srcdir"
  ar x ${_pkgname}_${pkgver}_all.deb  
}

package() {
  cd "$srcdir"
  tar xzvf data.tar.gz

# Patch for python2
cd "${srcdir}/usr/bin/"
sed -e "s_env python_&2_" -e "s_bin/python_&2_" -i `grep -rlE "(env python|bin/python)" .`

# Create directories and install files
install -d ${pkgdir}/usr/bin/
install -d ${pkgdir}/usr/share/applications
install -d ${pkgdir}/usr/share/locale/
install -d ${pkgdir}/usr/share/icons/

cp -R ${srcdir}/usr/bin/* ${pkgdir}/usr/bin
cp -R ${srcdir}/usr/share/applications/* ${pkgdir}/usr/share/applications
cp -R ${srcdir}/usr/share/locale/* ${pkgdir}/usr/share/locale
cp -R ${srcdir}/usr/share/icons/* ${pkgdir}/usr/share/icons

}

md5sums=('66d7ec3876c440c294a178cdc9e95cc2')
