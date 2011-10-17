pkgname=fortune-mod-fvl
pkgver=20030120
pkgrel=1
pkgdesc="Fortune cookies from the german blogger Felix von Leitner (http://blog.fefe.de)"
url="http://fortune-mod-fvl.sourceforge.net/"
arch=('any')
license=('None')
depends=('fortune-mod')
source=("http://sourceforge.net/projects/fortune-mod-fvl/files/fortune-mod-fvl/20030120/fortune-mod-fvl-${pkgver}.tar.gz/download")
md5sums=('beb9c76cb166e50994b5ad767ec0efd2')

build() {
    cd ${srcdir}/fortune-mod-fvl-${pkgver}/
	install -D -m644 fvl ${pkgdir}/usr/share/fortune/fvl
	install -D -m644 fvl.dat ${pkgdir}/usr/share/fortune/fvl.dat
	install -D -m644 fvl_vendor ${pkgdir}/usr/share/fortune/fvl_vendor
	install -D -m644 fvl_vendor.dat ${pkgdir}/usr/share/fortune/fvl_vendor.dat
}
