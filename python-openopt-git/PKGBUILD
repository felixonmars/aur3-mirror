# Contributor: Wael Nasreddine <gandalf@siemens-mobiles.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=python-openopt-git
pkgver=20131011
pkgrel=1
arch=('i686' 'x86_64')
license=('AGPLv3')
pkgdesc="Bibtex parser in Python 3"
depends=('python' 'python-pip')
optdepends=('python-sphinx')
url="https://github.com/sciunto/python-bibtexparser"
#source=(http://openopt.org/images/f/f3/OOSuite.zip)
#md5sums=('96f25d4a54b89c31f134eebfd17e095d')

_git_source=(git://github.com/sciunto/python-bibtexparser)
_git_name=python-bibtexparser

build() {
    git clone ${_git_source} --depth 1
}

package() {

    cd $startdir/src/${_git_name}/
    python setup.py install --root=$pkgdir

    #cd $startdir/src/PythonPackages/FuncDesigner
    #python setup.py install --root=$pkgdir

    #cd $startdir/src/PythonPackages/SpaceFuncs
    #python setup.py install --root=$pkgdir

    #cd $startdir/src/PythonPackages/OpenOpt
    #python setup.py install --root=$pkgdir
    #install -m755 -d "${pkgdir}/usr/include/python${_pyinc}"
    #ln -sf /usr/lib/python3.3/site-packages/openopt/core/include/openopt \
        #"${pkgdir}/usr/include/python${_pyinc}/openopt"
}
