# Maintainer Jakob Steltner <trurl@trurl.net>
# Contributor: Dan Serban
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Roberto Viola <cagnulein@gmail.com>

pkgname=fwbackups
pkgver=1.43.4
pkgrel=3
pkgdesc="Backup program that allows you to backup your documents anytime, anywhere"
url="http://www.diffingo.com/oss/fwbackups"
arch=('any')
license=('GPL')
depends=('python2-crypto' 'python2-paramiko' 'cron')
optdepends=('rsync: incremental backup support')
makedepends=('gnome-doc-utils' 'intltool')
source=(http://downloads.diffingo.com/$pkgname/$pkgname-$pkgver.tar.bz2 $pkgname-$pkgver-cronwriter-python2.patch)
md5sums=('a239a0438829f23e899d79f2158e1b1f' '483f1c546017ae0b2e765bbe771ebb8a')

build()
{
  export PYTHON=/usr/bin/python2
  cd $srcdir/$pkgname-$pkgver
  patch -p1 -i ../$pkgname-$pkgver-cronwriter-python2.patch
  ./configure --prefix=/usr
  make
}

package()
{
  cd $srcdir/$pkgname-$pkgver
  make prefix=$pkgdir/usr install
  sed -i 's/^python /python2 /g' $pkgdir/usr/bin/$pkgname
  sed -i 's/python$/python2/g'   $pkgdir/usr/bin/$pkgname-run
  sed -i 's/python$/python2/g'   $pkgdir/usr/bin/$pkgname-runonce
  sed -i 's/python$/python2/g'   $pkgdir/usr/share/$pkgname/cronwriter.py
  sed -i 's/python$/python2/g'   $pkgdir/usr/share/$pkgname/$pkgname-runapp.pyw
}
