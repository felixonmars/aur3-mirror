# $Id: PKGBUILD,v 1.5 2008/05/18 22:17:27 BaSh Exp $
# Maintainer: Douglas Soares de Andrade <dsa@aur.archlinux.org>

pkgname=python-scipy-svn-new
pkgver=5003
pkgrel=1
pkgdesc="SciPy (pronounced 'Sigh Pie') is open-source software for
mathematics, science, and engineering. Development version fom SVN"
arch=('i686' 'x86_64')
url="http://www.scipy.org"
license=('BSD')
depends=('python-numpy')
conflicts=('scipy' 'scipy_core' 'python-scipy')
source=()
md5sums=()

_svntrunk=http://svn.scipy.org/svn/scipy/trunk
_svnmod=scipy

build() {
  # check out sources
  cd ${srcdir}

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  python setup.py config_fc --fcompiler=gnu95 build || return 1
  python setup.py config_fc --fcompiler=gnu95 install --prefix=/usr --root=$startdir/pkg

  install -D -m644 LICENSE.txt $startdir/pkg/usr/share/licenses/$pkgname/LICENSE.txt
}

# vim:syntax=sh
