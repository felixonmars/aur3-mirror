# Contributor: uastasi <uastasi@archlinux.us>
pkgname=rb-open-folder
pkgver=0.4
pkgrel=1
pkgdesc="This rhythmbox plugin shows a menu entry to open the folder with the song being currently played."
url="http://www.infinicode.org/code/rb/"
arch=('i686')
license=('GPL')
depends=('rhythmbox')
source=(http://www.infinicode.org/code/rb/$pkgname-$pkgver.tar.gz)
md5sums=('21701561dee468d73633e678cd008c4b')

build() {
    cd $startdir/src/
    mv $pkgname-$pkgver/ $pkgname/
    mkdir -p $startdir/pkg/usr/lib/rhythmbox/plugins/
    cp -R $startdir/src/$pkgname $startdir/pkg/usr/lib/rhythmbox/plugins/
    }
