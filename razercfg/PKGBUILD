# $Id$
# Maintainer: polyzen <polycitizen@gmail.com>
# Contributor: Maxwell "Synthead" Pray <synthead@gmail.com>
# Contributor: Fergus Symon <fergofrog@fergofrog.com>

pkgname=razercfg
pkgver=0.30
pkgrel=4
pkgdesc="Next generation Razer device configuration tool"
arch=('any')
url="http://dual.bues.ch/cms/hacking/razercfg.html"
license=('GPL')
depends=('python' 'libusb')
makedepends=('cmake')
optdepends=('python-pyside: For qrazercfg')
backup=('etc/razer.conf')
source=("http://bues.ch/$pkgname/$pkgname-$pkgver.tar.bz2"{,.asc}
        "$pkgname.desktop"
        'razer.svg::http://upload.wikimedia.org/wikipedia/en/0/00/Razer_Snake_Logo.svg'
        'tmpfile.conf')
install="$pkgname.install"
sha256sums=('bfc4dc858be5627833aa1ae1cdbbf1a85b77afaed5d61113de4bd6e8797ca527'
            'SKIP'
            '83f763c414bec401a9c60439b2e15b138a53a279f96565981088824128120063'
            'dae3f745e741bf720066a7015677152792d095bff9bb95f23a38545921071904'
            'a6fa99646938e57bd8be18a38de86ccae5bb19c78e571265db5987a46d0bf21a')
validpgpkeys=('757FAB7CED1814AE15B4836E5FB027474203454C')  # Michael Busch

build() {
  cd $pkgname-$pkgver
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir"/$pkgname.desktop\
    "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -Dm644 "$srcdir"/razer.svg "$pkgdir"/usr/share/pixmaps/razer.svg
  install -Dm644 razer.conf "$pkgdir"/etc/razer.conf
  install -Dm644 "$srcdir"/tmpfile.conf\
    "$pkgdir"/usr/lib/tmpfiles.d/razerd.conf
}

# vim:set ts=2 sw=2 et:
