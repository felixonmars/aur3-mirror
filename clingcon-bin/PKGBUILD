# Maintainer: buhman <zack[at]buhman[dot]org>
pkgname=clingcon-bin
_pkgname=clingcon
pkgver=2.0.3
pkgrel=2
pkgdesc="an answer set solver for (extended) constraint normal logic programs (binary version)"
arch=('x86_64')
url="http://www.cs.uni-potsdam.de/clingcon/"
license=('GPL3')
depends=('re2c' 'lua51' 'boost-libs>=1.37')
optdepends=('sqlite3' 'mysql')
conflicts=('clingcon')
provides=('clingcon')
source=("http://downloads.sourceforge.net/project/potassco/${_pkgname}/${pkgver}/${_pkgname}-${pkgver}-x86_64-linux.tar.gz")

package() {
    install -D ${srcdir}/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
}

md5sums=('2980e27992f2c62ffac4995e76ba04c0')
