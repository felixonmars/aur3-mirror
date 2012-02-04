pkgname=festvox-ellpc11k
_pkgnameorig=festvox_ellpc11k
pkgver=1.95
pkgrel=2
pkgdesc="Castilian Spanish male speaker for Festival"
url="http://www.cstr.ed.ac.uk/projects/festival/"
license="UNKNOWN"
arch=('any')
depends=('festival')
source=("http://www.cstr.ed.ac.uk/downloads/festival/$pkgver/$_pkgnameorig.tar.gz")
md5sums=('e96a97644d36fcb89952ca65c283cea3')

build() {
	cd $startdir/src
	mkdir -p $startdir/pkg/usr/share/festival
	cp -r festival/lib/voices $startdir/pkg/usr/share/festival
}
