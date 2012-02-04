# Contributor: Orivej Desh <smpuj@bk.ru>
pkgname=radio.py
pkgver=0.5
pkgrel=3
pkgdesc="A command-line frontend for mplayer designed to make listening to online radio easy"
arch=("any")
url="http://www.guyrutenberg.com/radiopy/"
license=("GPL")
depends=("python" "mplayer")
source=("http://downloads.sourceforge.net/radiopy/$pkgname-$pkgver/$pkgname-$pkgver.tar.bz2")
md5sums=('5846ff15f629953ad333cbdc170d1825')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i -e '1c#!/usr/bin/python2' radio.py
  install -D radio.py "$pkgdir/usr/bin/radio.py"
}

