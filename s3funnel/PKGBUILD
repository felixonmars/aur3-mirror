# Maintainer: Daniel Graña <daniel@insophia.com>
pkgname=s3funnel
pkgver=0.5.2
pkgrel=1
pkgdesc="Multithreaded tool for performing operations on Amazon's S3"
arch=('i686' 'x86_64')
url='http://code.google.com/p/s3funnel/'
license=('GPL2')
depends=('python' 'python-workerpool' 'python-boto')
source=("http://s3funnel.googlecode.com/files/s3funnel-$pkgver.tar.gz")
md5sums=('68bb24c4f04be253a57e70a2a7b1cb59')

build() {
  cd $srcdir/s3funnel-$pkgver
  python setup.py install --root=$pkgdir || return 1
}
