# Maintainer: Jan B. <janboe@gmail.com>

pkgname=series60-remote
pkgver=0.4.0
pkgrel=4
pkgdesc="Tool to manage your S60 device"
arch=('i686' 'x86_64')
url="http://series60-remote.sourceforge.net"
license=('GPL')
depends=('python2' 'python2-qt' 'python-pybluez' 'obexftp' 'python2-matplotlib')
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz)

build() {
  cd $srcdir/$pkgname-$pkgver
  python2 setup.py install --prefix=$pkgdir/usr || return 1
}
md5sums=('adc345c3998e594da86c4df150f851e0')
