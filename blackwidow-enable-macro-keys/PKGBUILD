# Maintainer: Andrew Gallant <jamslam@gmail.com>
pkgname=blackwidow-enable-macro-keys
pkgver=20130610
pkgrel=1
pkgdesc="Enables Macro/FN keys in Linux for the Razer Black Widow keyboard."
arch=('any')
url="http://finch.am/projects/blackwidow/"
license=('Public Domain')
depends=('python2-pyusb')
makedepends=()
checkdepends=()
provides=('blackwidow-enable-macro-keys')
source=('https://gist.github.com/BurntSushi/5751418/raw/blackwidow_enable.py')
md5sums=('6157301eebde0ac975e6765c4db25731')
install=blackwidow-enable-macro-keys.install

build() {
  cd "$srcdir"
  sed 's^#!/usr/bin/python^#!/usr/bin/env python2^g' \
    -i "$srcdir/blackwidow_enable.py"
  install -Dm755 \
    "$srcdir/blackwidow_enable.py" \
    "$pkgdir/usr/bin/blackwidow-enable"
}

# vim:set ts=2 sw=2 et:
