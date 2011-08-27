# Maintainer: Matthias Maennich <arch@maennich.net>

pkgname=synergy-plus
pkgver=1.3.5
pkgrel=1
pkgdesc="Share your mouse and keyboard between several computers"
arch=('i686' 'x86_64')
url="http://code.google.com/p/synergy-plus"
license=('GPL2')
depends=('libxtst' 'libsm' 'libxinerama' 'qt')
makedepends=('cmake' 'subversion')
source=("synergys.rc" "qsynergy.desktop" "synergy-plus.png")
md5sums=('056e59b1d04a66820ffa4b53e5ec20bc'
         'cc77460b8748fbba29ec1dd6a68712b7'
         '3b5abceff557ba538e5e8c6676a875bd')
provides=('synergy','qsynergy')
replaces=('synergy','qsynergy')
conflicts=('synergy','qsynergy')
backup=('etc/synergy.conf')

_svnmod=$pkgname-$pkgver
_svntag="http://$pkgname.googlecode.com/svn/tags/$pkgver"

build(){
    cd $srcdir

    # get the sources
    msg "Connecting to $_svntag ..."
    
    svn co $_svntag $_svnmod --depth immediates
    
    cd $_svnmod
   
    cd cmake && svn update --set-depth infinity && cd ..
    cd cmd && svn update --set-depth infinity && cd ..
    cd examples && svn update --set-depth infinity && cd ..
    cd gui && svn update --set-depth immediates && cd ..
    cd gui/res && svn update --set-depth infinity && cd ../..
    cd gui/src && svn update --set-depth infinity && cd ../..
    cd lib && svn update --set-depth infinity && cd ..
    
    msg "SVN checkout done or server timeout"

    cmake . -DCMAKE_INSTALL_PREFIX=/usr
    make

    cd gui

    qmake PREFIX=/usr
    make
}

package(){
    cd $srcdir/$_svnmod

    make DESTDIR=$pkgdir install


    install -m755 -d $pkgdir/etc
    install -m755 -d $pkgdir/etc/rc.d
    install -m644 $srcdir/$_svnmod/examples/synergy.conf $pkgdir/etc/
    install -Dm755 $srcdir/synergys.rc $pkgdir/etc/rc.d/synergy
   
    
    install -m755 -d $pkgdir/usr/bin
    install -m755 -d $pkgdir/usr/share/applications
    install -m755 -d $pkgdir/usr/share/pixmaps

    install -m755 $srcdir/$_svnmod/gui/qsynergy $pkgdir/usr/bin/
    install -m755 $srcdir/qsynergy.desktop $pkgdir/usr/share/applications/
    install -m755 $srcdir/synergy-plus.png $pkgdir/usr/share/pixmaps/

}
