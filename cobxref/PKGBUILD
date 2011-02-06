# Maintainer: Valere Monseur <valere_monseur@hotmail.com>

pkgname=cobxref
pkgver=171
pkgrel=1
pkgdesc="Cobol cross reference tool for Open Cobol"
arch=(i686 x86_64)
url="http://svn.wp0.org/add1/tools/cobxref/"
license=('GPL')
depends=('open-cobol')
makedepends=('subversion')
md5sums=('')

_svntrunk=http://svn.wp0.org/add1/tools/cobxref/
_svnmod=cobxref

build() {
   cd "$srcdir"

   if [ -d $_svnmod/.svn ]; then
      (cd $_svnmod && svn up)
   else
      svn co $_svntrunk --config-dir ./ $_svnmod
   fi

   msg "SVN checkout done or server timeout"
   msg "Starting make..."

   cd $_svnmod/

   cobc -debug -O2 -x $pkgname.cbl
   install -D -m755 $pkgname "$pkgdir"/usr/bin/$pkgname || return 1
   install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING" || return 1
}
