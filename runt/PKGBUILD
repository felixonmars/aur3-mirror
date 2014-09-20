# Contributor: Alexej Magura <agm2819*gmail*>
# Maintainer : David Phillips <dbphillipsnz ta gmail>
# 
pkgname=runt
pkgver=0.2.0
pkgrel=2
pkgdesc="An alternative to aurphan"
arch=('any')
url="https://bitbucket.org/dopm/pub_rel/src"
license=('GPL3')
depends=('aura' 'ruby')
source=("$pkgname-${pkgver}.tar.gz")
md5sums=('4a098ec6e769ef2aae267cfdaba133e8')

package() {
	cd ${srcdir}/${pkgname}-${pkgver}/ 
	for files in ${pkgname}.rb ; do
		install -D -m 755 $files ${pkgdir}/usr/bin/${pkgname}
    done
	for files in docs/* ; do
	install -d $pkgdir/usr/share/doc/$pkgname
		install -m 644 -t $pkgdir/usr/share/doc/$pkgname docs/$files
	done 
}
