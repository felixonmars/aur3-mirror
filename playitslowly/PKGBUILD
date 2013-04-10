# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: sausageandeggs <sausageandeggs@archlinux.us>

pkgname=playitslowly
pkgver=1.4.0
pkgrel=3
pkgdesc="Software to play back audio files at a different speed or pitch. It does also allow you to loop over a certain part of a file."
arch=(any)
url=http://29a.ch/$pkgname
license=(GPL3)
depends=(pygtk gstreamer0.10-python gstreamer0.10-good-plugins gstreamer0.10-bad-plugins hicolor-icon-theme)
install=$pkgname.install
source=($url/$pkgname-$pkgver.tar.gz)
sha256sums=('5c7ec0b1bf82c9b95ab8a86e8f123b9106d7836d8cd21a66c4f996b9ba791fb6')
sha512sums=('510ded6c986b7c9d6845f837799b5276922b70ce65648b462540040b49efbfd09d56071566ffc64ff0bcd438396db484be5b995d9c0b3bba6edac7578a5b5c4d')

prepare() {
    cd $pkgname-$pkgver/
    sed -ri 's:python\b:&2:' $pkgname/app.py bin/$pkgname
}

build() {
    cd $pkgname-$pkgver/
    python2 setup.py build
}

package() {
    cd $pkgname-$pkgver/
    python2 setup.py install --prefix=/usr --root="$pkgdir"
}
