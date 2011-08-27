# Contributor: Eugeni Dodonov <eugeni@dodonov.net>
pkgname=statist
pkgver=1.4.1
pkgrel=1
pkgdesc="Statist is a terminal-based statistics program with an interactive menu that makes it very easy to use"
arch=(i686 x86_64)
license=('GPL')
url="http://statist.wald.intevation.org/"
depends=('gnuplot' 'gettext')
source=(http://wald.intevation.org/frs/download.php/301/statist-1.4.1.tar.gz)
md5sums=('b49a877c037f44cb0ba537044bb47d24')

build()
{
  cd ${startdir}/src/${pkgname}-${pkgver}
  make || return 1
  make install PREFIX=$startdir/pkg/usr || return 1
}
