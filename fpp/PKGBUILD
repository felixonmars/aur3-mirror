#Maintainer <pritam@pritambaral.com>

pkgname=fpp
pkgver=0.5.6
pkgrel=1
pkgdesc="Facebook PathPicker is a simple command line tool that solves the perpetual problem of selecting files out of bash output."
arch=('any')
url='http://facebook.github.io/PathPicker/'
license=('BSD')
depends=('bash' 'python2')
source=("https://github.com/facebook/PathPicker/releases/download/$pkgver/$pkgname.$pkgver.tar.gz")
md5sums=('d07d99f9a596313bacb0508f80920466')

package() {
  cd $pkgdir
  mkdir -p opt/$pkgname/src
  install -m 644 $srcdir/src/* ./opt/$pkgname/src/

  install -m 755 $srcdir/$pkgname ./opt/$pkgname/
  mkdir -p usr/bin
  ln -s /opt/$pkgname/$pkgname usr/bin/$pkgname
}
