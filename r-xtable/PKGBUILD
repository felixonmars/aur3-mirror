# Contributor: Nick B <Shirakawasuna at gmail _dot_com>
# Maintainer:  Matt Monaco <net 0x01b matt>

_rpkg=xtable
pkgname=r-$_rpkg
pkgver=1.7_0
pkgrel=1
pkgdesc="Export tables to LaTeX or HTML"
arch=('i686' 'x86_64')
url="http://xtable.r-forge.r-project.org"
license=("GPL2")
depends=('r>=2.10.0')
source=("http://cran.r-project.org/src/contrib/${_rpkg}_${pkgver/_/-}.tar.gz")
md5sums=('d830304efcf6e1985366064cb3f83639')

package() {

	cd "$srcdir"
	mkdir -p "$pkgdir/usr/lib/R/library/"
	R CMD INSTALL -l "$pkgdir/usr/lib/R/library/" $_rpkg
}

# vim: set noet :
