#Maintainer: Dariusz Duma <dhor at toxic net pl>
pkgname=gtkrawgallery
pkgver=0.9.9
pkgrel=1
pkgdesc="A photo manager and camera raw file processor"
arch=('any')
url="http://gtkrawgallery.sourceforge.net/"
license=('GPL')
depends=('python2' 'imagemagick' 'dcraw' 'perl-exiftool' 'python2-numpy' 'dos2unix')
#install=${pkgname}.install
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.bz2" "gtkrawgallery.desktop" "locale.patch")
md5sums=('7d25c68c9cd8d96838fc60bd35f11d51' '9d8b5b372bbc06334c3d13d708970696' '92e8db53a20fdf6c577ed08caf2ed98c')

#build() {
	
#	cd ${srcdir}/${pkgname}-${pkgver}
#	python2 setup.py build

#	cp ../gtkrawgallery.desktop ${srcdir}/${pkgname}-${pkgver}/src/
#}
package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	patch -p1 -i $srcdir/locale.patch
	cp $srcdir/gtkrawgallery.desktop $srcdir/${pkgname}-${pkgver}/src/
	find -name "*.py" | xargs -n1 dos2unix
	dos2unix gtkrawgallery
	python2 setup.py install --prefix=/usr --root=${pkgdir} 
}
