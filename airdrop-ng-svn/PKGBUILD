# Maintainer: sakalisc <chrissakalis at gmail dot com>
# Contributor: fnord0 [fnord0 <AT> riseup <DOT> net]
# Contributor: Techlive Zheng <techlivezheng [at] gmail [dot] com>

pkgname=airdrop-ng-svn
pkgdesc="A rule based deauth tool on aircrack-ng"
pkgver=r2493
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.aircrack-ng.org"
license=('GPLv2')
depends=('python2' 'python2-pylorcon' 'lorcon')
optdepends=("psyco: JIT compiler for python")
makedepends=('subversion')
conflicts=('airdrop-ng')
provides=('airdrop-ng')
options=(!emptydirs)
source=('svn+http://svn.aircrack-ng.org/trunk/scripts/airdrop-ng')
md5sums=('SKIP')
sha256sums=('SKIP')

_svnmod=airdrop-ng

pkgver() {
	cd "${_svnmod}"
	local ver="$(svnversion)"
	printf "r%s" "${ver//[[:alpha:]]}"
}

package() {
	cd "${srcdir}"
	grep -rl python "${_svnmod}" | xargs sed -i 's|python|python2|g' || return 1
	cd "${srcdir}/${_svnmod}"
	python2 setup.py install --root="$pkgdir/" --optimize=1
}
