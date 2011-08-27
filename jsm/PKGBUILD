# Maintainer: Jan Dlabal <dlabaljan at gmail dot com>
pkgname=jsm
pkgver=0.2
pkgrel=1
pkgdesc="Simple script to send email, without requiring a complex SMTP server"
arch=('i686' 'x86_64')
url="http://houbysoft.com/"
license=('GPL3')
depends=('python2' 'python2-pydns')
source=('https://raw.github.com/houbysoft/short/6cbfeea7d99e063959a0/jsm.py')
md5sums=('6f422bfe3159b4dcc9dcd07b6ad0130b')

build() {
  install -D jsm.py "$pkgdir/usr/bin/$pkgname"
}

