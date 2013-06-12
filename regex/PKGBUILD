# Maintainer: Alexej Magura <agm2819*gmail*>
# 
# 
pkgname=regex
pkgver=1.0c.rev40
pkgrel=1
pkgdesc="regular expression generator"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/regexgen/"
license=('GPL3')
depends=('gcc-libs')
source=("http://sourceforge.net/projects/regexgen/files/${pkgver}/$pkgname-${pkgver}.tar.gz/download")
md5sums=('22c74e42311c938c62c613869cc67764')


build() {

    cd $srcdir/$pkgname-$pkgver
    
    make

}

package() {

    cd $srcdir/$pkgname-$pkgver

    make DESTDIR=$pkgdir install


}
