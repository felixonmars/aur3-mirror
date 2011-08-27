pkgname=libvmime-svn
pkgver=540
pkgrel=2
pkgdesc="A C++ class library for working with MIME messages"
arch=('i686' 'x86_64')
url="http://www.vmime.org/"
license=('GPL')
depends=('gsasl postfix')
makedepends=('subversion pkgconfig scons')
_svntrunk="https://vmime.svn.sourceforge.net/svnroot/vmime/trunk"
_svnmod="vmime"
source=()
md5sums=()

build() {
        cd $srcdir
        if [ -d ./$_svnmod ]; then
                cd $_svnmod
                svn up -r $pkgver
        else
                svn co $_svntrunk $_svnmod -r $pkgver
        fi

        cd $srcdir/$_svnmod/vmime
        scons prefix=$pkgdir/usr install  || return 1

        cd $pkgdir
}
