 
# Contributor: said <atvordhosbn at gmail dot com> 

pkgname=konvertible
pkgver=1.0.1
pkgrel=1
pkgdesc="A program to convert audio files to other audio formats using ffmpeg."
arch=('i686' 'x86_64')
url="http://msnkambule.wordpress.com/konvertible/"
license=('GPL')
depends=('kdepimlibs' 'taglib' 'ffmpeg')
source=(http://kde-apps.org/CONTENT/content-files/116892-$pkgname-$pkgver.tar.bz2)
md5sums=('0dca5905eaf36510115421eda5cd80d4')

build() {
  cd  $srcdir/$pkgname-$pkgver
    cmake . -DCMAKE_INSTALL_PREFIX=/$pkgdir/usr || return 1
    make || return 1
    make INSTALL_ROOT=$pkgdir install || return 1 
}
