# Maintainer: speps <speps at aur dot archlinux dot org>
# Contributor: Angel Velasquez <angvp@archlinux.org> 

pkgname=pykaraoke
pkgver=0.7.5
pkgrel=2
pkgdesc="A free karaoke player for Linux, FreeBSD, Windows and GP2X."
arch=('i686' 'x86_64')
url="http://www.kibosh.org/pykaraoke/index.php"
license=('LGPL')
depends=('python2-pygame' 'python2-numpy' 'wxpython' 'desktop-file-utils')
optdepends=('timidity++: Midi Support')
install="$pkgname.install"
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.zip")
md5sums=('0a18dc2c4b2b56ee81987fac81d3f011')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  # python2 shebang
  sed -i "s|env python|&2|" `grep -rl "env python"`
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir/"
}
