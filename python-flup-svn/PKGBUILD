# Contributor: Lauri Jäntti <janttilauri at gmail.com>
pkgname=python-flup-svn
pkgver=2354
pkgrel=1
pkgdesc="random Python WSGI stuff"
url="http://trac.saddi.com/flup"

depends=('python')
makedepends=('subversion')
arch=(i686 x86_64)
license='BSD'

source=()
md5sums=()

_svntrunk=http://svn.saddi.com/flup/trunk
_svnmod=flup

build() {
    cd $startdir/src

    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod

    msg "SVN checkout done or server timeout"
    msg "Starting make..."

    cp -r $_svnmod $_svnmod-build
    cd $_svnmod-build

    python setup.py build || return 1
    python setup.py install --root=$startdir/pkg

}

