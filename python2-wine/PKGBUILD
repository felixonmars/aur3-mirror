# Maintainer: maz-1 <loveayawaka at gmail dot com>
pkgname=python2-wine
pkgver=0.2.5.5
pkgrel=1
pkgdesc="python-wine allows you to configure Wine through Python."
arch=('i686' 'x86_64')
url="https://launchpad.net/vineyard"
license=('GPL2')
depends=('python2' 'wine')
source=("http://launchpad.net/vineyard/1.4/1.4.1/+download/python-wine-$pkgver.tar.gz")
md5sums=('1231e577a5437f06de98c18adc574f22')


package() {
cd $srcdir/python-wine-$pkgver
python2 setup.py install --prefix=$pkgdir/usr
}