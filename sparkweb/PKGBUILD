pkgname=sparkweb
pkgver=0.9.0
pkgrel=1
pkgdesc="Cross-platform real-time collaboration client optimized for business and organizations."
arch=('i686' 'x86_64')
url="http://www.igniterealtime.org/projects/sparkweb/"
license="GPL2"

source=(http://www.igniterealtime.org/builds/${pkgname}/${pkgname}_${pkgver//./_}.tar.gz)
md5sums=('cd9ea0a56dce80e2504ed862060d6e66')

build() {
    cd $srcdir
    mkdir -p $pkgdir/srv/http
    mv $pkgname $pkgdir/srv/http
}
