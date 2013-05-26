# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Wieland Hoffmann <the_mineo@web.de>
# Contributor: Amr Hassan <amr.hassan@gmail.com>

pkgname=python2-pylast
pkgver=0.5.11
pkgrel=2
pkgdesc="A Python interface to the Last.fm API"
arch=(any)
url="http://pylast.googlecode.com"
license=(Apache)
depends=('python2')
makedepends=(python2-distribute)
source=(http://pypi.python.org/packages/source/${pkgname:0:1}/${pkgname#*-}/${pkgname#*-}-$pkgver.tar.gz)
sha256sums=('bf35820be35447d55564d36072d40b09ac8a7fd41a6f1a7a9d408f4d0eaefac4')
sha512sums=('4b313156aff927f1ec61a848d1ee4c74fde348e1faef6d8dcf9578b164d65621c85bac3de0288d7aae0147157cc2c01a048d7293c191e9c1ede1197527d987e6')

build() {
    cd ${pkgname#*-}-$pkgver/
    python2 setup.py build
}

package() {
    cd ${pkgname#*-}-$pkgver/
    python2 setup.py install --root="$pkgdir" --optimize=1
}
