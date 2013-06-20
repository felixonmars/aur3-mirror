# Contributor: Wael Nasreddine <gandalf@siemens-mobiles.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=python-openopt-svn
pkgver=2092
pkgrel=1
arch=('i686' 'x86_64')
license=('BSD')
pkgdesc="Optimization library"
depends=('python-numpy')
conflicts=('python-openopt')
url="http://www.openopt.org"
#source=(http://openopt.org/images/f/f3/OOSuite.zip)
md5sums=('96f25d4a54b89c31f134eebfd17e095d')

_svntrunk="svn://openopt.org/PythonPackages"
_svnname="OOSuite"

build() {
  cd $srcdir
  if [ -d $_svnname/.svn ]; then
      cd $_svnname && svn up -r $pkgver
  else
      svn co $_svntrunk $_svnname --config-dir ./ -r $pkgver
  fi

  #python install_all.py --prefix=$pkgdir/usr

}

package() {

    cd $srcdir/$_svnname/DerApproximator
    python setup.py install --root=$pkgdir

    cd $srcdir/$_svnname/FuncDesigner
    python setup.py install --root=$pkgdir

    cd $srcdir/$_svnname/SpaceFuncs
    python setup.py install --root=$pkgdir

    cd $srcdir/$_svnname/OpenOpt
    python setup.py install --root=$pkgdir
    #install -m755 -d "${pkgdir}/usr/include/python${_pyinc}"
    #ln -sf /usr/lib/python3.3/site-packages/openopt/core/include/openopt \
        #"${pkgdir}/usr/include/python${_pyinc}/openopt"
}
