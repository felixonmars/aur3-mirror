pkgname=freesmee
pkgver=0.81
_ticppver=2.5.3
pkgrel=1
pkgdesc="Freesmee is a software that sends free/low cost SMS and MMS through internet"
url="http://www.freesmee.com/"
license=(?)
arch=('i686' 'x86_64')
depends=('binutils' 'ticpp-svn' 'qtwebkit' )
conflicts=('jacksms' 'jacksms-desktop')

source=(http://widehat.opensuse.org/repositories/home:/freesmee/xUbuntu_12.10/freesmee_$pkgver.orig.tar.gz)

md5sums=('52dd37f18304c3b46723a14da6ca1edb')

build(){
    cd $srcdir/$pkgname-$pkgver 
    qmake -o Makefile Freesmee.pro
    make
}
         
         
package() { 
    cd $srcdir/$pkgname-$pkgver
    install -Dm755 Freesmee $pkgdir/usr/bin/Freesmee
    install -Dm644 $pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
    install -Dm644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
    install -Dm644 sounds/newjms.wav $pkgdir/usr/share/$pkgname/newjms.wav
} 
 
