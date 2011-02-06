# Contributor: shamrok <szamrok@gmail.com>

pkgname=klogshow
pkgver=1.0.2
pkgrel=2
pkgdesc="Qt4 application that displays the last few lines of a text files on your desktop."
arch=('i686')
url='http://kde-apps.org/content/show.php/KlogShow?content=53460'
license=('GPL')
source=(http://dl.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tgz)
depends=('qt4')
md5sums=('feed0708a713ff32b4a052ad923877e9')

build() {
    cd $startdir/src/$pkgname-$pkgver
    source /etc/profile.d/qt4.sh
    make || return 1
    install -D -m 755 build/src/klogshow $startdir/pkg/usr/bin/klogshow
}