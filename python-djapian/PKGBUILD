# Contributor: Piotr Husiatyński <phusiatynski@gmail.com>

pkgname=python-djapian
pkgver=242
pkgrel=1
pkgdesc="Search API for Django with Xapian"
license=("New BSD License")
url="http://code.google.com/p/djapian/"
depends=('django' 'xapian-python-bindings')
arch=('i686' 'x86_64')
source=()
md5sums=()

_svntrunk=http://djapian.googlecode.com/svn/trunk/
_svnmod=djapian

build() {
    cd $startdir/src
    msg "Connecting to $_svntrunk SVN server...."
    if [[ -d $_svnmod/.svn ]]; then
        (cd $_svnmod && svn up -r $pkgver)
    else
        svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
    fi
    cd $_svnmod
    python setup.py install --root=$startdir/pkg || return 1
}
