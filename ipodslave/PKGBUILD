#Contributor: Christian Estrella Rdz <warc3r@gmail.com>

pkgname=ipodslave
pkgver=0.8
pkgrel=1
pkgdesc="Enables KIO aware apps to access the music stored on an ipod"
url="http://kpod.sourceforge.net/ipodslave/"
license=('GPL')
depends=('kdelibs' 'id3lib' 'libqtpod')
arch=('i686' 'x86_64')
conflicts=('ipodslave')
replaces=('ipodslave')
source=(http://downloads.sourceforge.net/kpod/$pkgname-$pkgver-pre1.tar.bz2)
md5sums=('516b566fe7da4f2ab767734914a2af94')

build()
{
cd $startdir/src/$pkgname-$pkgver-pre1
./configure --prefix=/opt/kde
make || return 1
make DESTDIR=$startdir/pkg install
}