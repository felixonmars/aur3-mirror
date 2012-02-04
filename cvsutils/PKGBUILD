# Contributor: Dongsheng Cai <dongsheng@moodle.com>
pkgname=cvsutils
pkgver=0.2.5
pkgrel=1
pkgdesc="CVS Utilities is a collection of scripts, that allow you to manage the files in the CVS working directory"
arch=('i686' 'x86_64')
url="http://www.red-bean.com/cvsutils/"
license=('GPL')
depends=('perl' 'cvs')
source=("http://www.red-bean.com/cvsutils/releases/${pkgname}-${pkgver}.tar.gz")
md5sums=('7e104c4bbace3d7230ade5403a06007f')

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    ./configure --prefix=/usr
    make || return 1
    make DESTDIR="$pkgdir/" install || return 1
}

