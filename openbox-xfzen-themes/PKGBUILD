# Maintainer: Košava <kosava@archlinux.us>
pkgname=openbox-xfzen-themes
pkgver=0.1
pkgrel=4
pkgdesc="Three themes, xfzen style."
arch=('any')
url="http://www.box-look.org/"
license=('GPL' 'Artistic 2.0')
depends=('openbox')
optdepends=('gtk-xfce-engine' 'gtk-engines')
source=('http://www.box-look.org/CONTENT/content-files/94937-xfzengreen.tar.gz'
	'http://www.box-look.org/CONTENT/content-files/94297-orange.tar.gz'
	'http://www.box-look.org/CONTENT/content-files/94296-blue.tar.gz')
md5sums=('935f50a404877cef49468029fb83be31'
	 '917535f0140f1367fa5dcd83a6b827d3'
         '69eb99ae95e823b7c86fd5bf33b09e9f')

build() {
  cd $srcdir
  install -d $pkgdir/usr/share/themes/ $pkgdir/usr/share/icons/
  cp -rf "blue/xfzen blue" "orange/xfzen orange" "xfzengreen/xfzen green" $pkgdir/usr/share/themes/ 
  cp -rf "blue/area blue" "orange/area orange" "xfzengreen/area green" $pkgdir/usr/share/icons/ 
}