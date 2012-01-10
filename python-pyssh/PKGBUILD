# Maintainer: kiooeht <kiooeht at gmail dot com>
# Contributor: wulax <j.sjolund@gmail.com>

pkgname=python-pyssh
pkgver=0.3
pkgrel=2
pkgdesc="PySSH is a Python module for programmatically controlling ssh and scp"
arch=('any')
url="http://pyssh.sourceforge.net/"
depends=('python2')
license=('GPL')
source=(http://downloads.sourceforge.net/sourceforge/pyssh/0.3/pyssh-source.tar.gz)
md5sums=('ae3a9ffa9545310e14bb013e9ee399c0')

build() {
  cd $srcdir/pyssh
  python2 setup.py install --prefix=$pkgdir/usr
}
