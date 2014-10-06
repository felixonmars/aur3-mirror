# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: rnestler

pkgname=mathics-git
pkgver=0.6rc1.87.gff9e18f
pkgrel=1
pkgdesc="General-purpose online computer algebra system featuring Mathematica-compatible syntax and functions"
arch=('i686' 'x86_64')
url="http://www.mathics.org"
license=('GPL3')
depends=('cython2' 'python2-gmpy>=1.04' 'python2-mpmath' 'python2-django' 'python2-sympy>=0.7' 'python2-distribute')
makedepends=('git')
provides=('mathics')
conflicts=('mathics')
install=mathics.install
source=("git+https://github.com/poeschko/Mathics.git")
md5sums=('SKIP')
_gitname="Mathics"

pkgver() {
  cd "$srcdir"/"$_gitname"
  git describe --tags | sed 's|-|.|g' | cut -c2-
}

prepare() {
  cd "$srcdir"/"$_gitname"
  sed -i '1s+python+python2+' mathics/manage.py initialize.py \
      mathics/builtin/pymimesniffer/magic.py
}

package() {
  cd "$srcdir/$_gitname"
  python2 setup.py install --root=${pkgdir}
  install -m 755 initialize.py \
	  "${pkgdir}/usr/lib/python2.7/site-packages/mathics_initialize.py"
  chmod +x "${pkgdir}/usr/lib/python2.7/site-packages/mathics/manage.py"
}
