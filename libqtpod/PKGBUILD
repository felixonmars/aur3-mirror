#Contributor: Christian Estrella Rdz <warc3r@gmail.com>

pkgname=libqtpod
pkgver=0.3
pkgrel=1
pkgdesc="library for ipodslaves"
url="http://kpod.sourceforge.net/ipodslave/"
license=('GPL')
depends=('kdelibs' 'rpmextract')
arch=('i686' 'x86_64')
conflicts=('libqtpod')
replaces=('libqtpod')
source=(http://ie.archive.ubuntu.com/sourceforge/k/kp/kpod/${pkgname}-${pkgver}.rc1-1-SuSE10.1.i586.rpm)
md5sums=('7bd4064b2d9aae30aef397042b93ec1f')

build()
{
cd $startdir/src/
/usr/bin/rpmextract.sh $pkgname-$pkgver.rc1-1-SuSE10.1.i586.rpm
cp -r usr $startdir/pkg/
}