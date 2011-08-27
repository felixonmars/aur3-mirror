#Contributor: Bill Streeter <quimax@tds.net>
#Credit to Tebari on the forums for the origional build from the forums.
pkgname=fsfn-svn
pkgver=56
pkgrel=1
pkgdesc="Sony Vaio FS Laptop hotkey handler"
arch=('i686')
url="http://developer.berlios.de/projects/fsfn/"
license=('GPL')
depends=('xosd')
makedepends=('subversion')
backup=('etc/fsfn.conf')
source=('fsfn.rc.d')
md5sums=('f2c84cb5690b89407e439fd8ec572aa6')


_svntrunk=svn://svn.berlios.de/fsfn/trunk
_svnmod=fsfn

build() {
    cd $startdir/src

    msg "Starting SVN checkout..."
    
    svn co $_svntrunk/$_svnmod -r $pkgver $_svnmod
    
    msg "SVN checkout done or server timeout" 
    msg "Starting make..."
    
    cp -r $_svnmod $_svnmod-build
    cd $_svnmod-build

    ./configure --prefix=/usr
    make || return 1
    make prefix=$startdir/pkg/usr install

    cd $startdir/src
    install -Dm755 fsfn.rc.d $startdir/pkg/etc/rc.d/fsfn
    install -Dm644 $_svnmod-build/etc/fsfn.conf $startdir/pkg/etc/fsfn.conf
    rm -rf $_svnmod-build
}