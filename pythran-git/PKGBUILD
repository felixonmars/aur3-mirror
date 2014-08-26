# Maintainer : Garrik 

pkgname=pythran-git
pkgver=25.08.14
pkgrel=1
pkgdesc="A claimless python to c++ converter"
arch=('i686' 'x86_64')
url="http://pythonhosted.org/pythran/"
license=('custom')
depends=('python2-networkx' 'python2-ply' 'python2-numpy' 'gperftools' 'gmp' 'boost')
makedepends=('git' 'cmake')
provides=('pythran')
conflicts=('pythran')
source=()
md5sums=()

_gitroot="https://github.com/serge-sans-paille/pythran.git"


prepare() {
    msg "Connecting to GIT server ..."
    if [[ -d $srcdir/$pkgname ]]; then
        cd $srcdir/$pkgname && git pull origin || return 1
    else
        git clone $_gitroot $srcdir/$pkgname || return 1
        cd $srcdir/$pkgname
    fi  
    msg "GIT checkout done or server timeout"
}

package() {
    cd $srcdir/$pkgname
    python2 setup.py install --root=$pkgdir
    install -D -m0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"   

}

