# Maintainer: noname

pkgname=human-netbook-theme
pkgver=0.16
pkgrel=1
pkgdesc="Human with panel theme"
arch=('any')
depends=('gtk-engine-murrine' 'human-icon-theme')
makedepends=('python-distutils-extra')
url="https://launchpad.net/human-netbook-theme"
license=('GPL')
source=("https://launchpad.net/ubuntu/maverick/+source/human-netbook-theme/${pkgver}/+files/human-netbook-theme_${pkgver}.tar.gz")
md5sums=('0a7a66804d53a57ac8cff88ebd98d95e')
                       
build() {
    cd $startdir/src/$pkgname-$pkgver
    python2 setup.py install --prefix=$pkgdir/usr
}
