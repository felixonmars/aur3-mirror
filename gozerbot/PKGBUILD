# Contributor: Wijnand Modderman <aur@tehmaze.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Jakub Vitak <mainiak at gmail dot com>

pkgname=gozerbot
pkgver=0.9.1.3all
pkgrel=2
pkgdesc="gozerbot a python irc and jabber bot"
url="http://www.gozerbot.org/"
license="BSD"
depends=('python' 'python-sqlalchemy' 'python-simplejson')
optdepends=('xmlpppy: support jabber'
 'mysql-python: support MySQL backend')
arch=('any')
install=
_aur_url='http://aur.archlinux.org/packages/gozerbot/gozerbot'
source=("$_aur_url/setup.cfg" "http://gozerbot.googlecode.com/files/$pkgname-$pkgver.tar.gz")

build() {
  cd $srcdir/$pkgname-$pkgver
  cp -v $srcdir/setup.cfg .
  python setup.py install --root=$pkgdir
  install -d $pkgdir/usr/share/man/man1
  cp -v $srcdir/$pkgname-$pkgver/man/gozerbot.1 $pkgdir/usr/share/man/man1
}
md5sums=('5dfa23196795ec5c18b9afe6b4d4ba28'
         'f56ccb6eaf059dae17a3b6c681c4ca54')
