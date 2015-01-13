#Contributor: Otakar Haška <ota.haska@seznam.cz>

pkgname=swatchbooker
pkgver=0.7.3
pkgrel=2
pkgdesc="Swatch book viewer/convertor/editor"
url="http://www.selapa.net/swatchbooker/"
depends=('python2' 'python2-pyqt' 'python2-lcms' 'python-imaging')
arch=('i686' 'x86_64')
license="GPL"
conflicts=()
source=(http://launchpad.net/swatchbooker/trunk/0.7.3/+download/SwatchBooker-$pkgver.tar.gz
)
md5sums=('d5c2d6d58679b233e2c298381b164acd')

build() {
# Build Ipe
cd ${srcdir}/SwatchBooker-$pkgver
python2 ./setup.py build

}

package() {
mkdir ${pkgdir}/usr
cd ${srcdir}/SwatchBooker-$pkgver
python2 ./setup.py install --prefix ${pkgdir}/usr/
for i in ${pkgdir}/usr/bin/*; do chmod +x $i; done
for i in ${pkgdir}/usr/share/applications/*.desktop; do sed -i 's/Icon=swatchbooker/Icon=\/usr\/share\/icons\/swatchbooker.svg/g' $i; done
sed -i 's/which python/which python2/g' ${pkgdir}/usr/bin/swatchbooker
}