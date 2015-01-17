pkgname=ruby-install
pkgver=0.5.0
pkgrel=1
pkgdesc="Compile and install Ruby"
url=https://github.com/postmodern/ruby-install
arch=('any')
license=('MIT')
source=(ruby-install-${pkgver}.tar.gz::https://github.com/postmodern/ruby-install/archive/v${pkgver}.tar.gz)
md5sums=('29c05e271236457994e6e008b4edb898')

package() {
    cd $srcdir/ruby-install-${pkgver}
    make "PREFIX=$pkgdir/usr" install
}
