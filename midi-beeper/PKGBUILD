# Maintainer: KISBread <kisbread@gmail.com>
pkgname=midi-beeper
pkgver=1.3
pkgrel=2
pkgdesc="A python program to play MIDI ﬁles by beeping"
arch=('any')
url="http://people.ds.cam.ac.uk/ssb22/mwrhome/midi-beeper.html"
license=('GPL')
depends=('beep' 'python2')
source=(http://people.ds.cam.ac.uk/ssb22/mwrhome/midi-beeper.py)
md5sums=('dc66f26536dc22c00c044849e6456043')

prepare() {
  sed "s,#!/usr/bin/env\ python,#!/usr/bin/env\ python2,g" -i "$srcdir/$pkgname.py"
}

package() {
  install -Dm755 "$srcdir/$pkgname.py" "$pkgdir/usr/bin/$pkgname"
}
