pkgname=python2-mongoalchemy
pkgver=0.14.2
pkgrel=1
pkgdesc="A Python Document-Object Mapper/Toolkit for Mongo Databases"
url="http://http://www.mongoalchemy.org/"
depends=('python2' 'python2-pymongo')
makedepends=('python2-distribute' 'python2-pip')
license=('MIT')
arch=('any')
source=('http://pypi.python.org/packages/source/M/MongoAlchemy/MongoAlchemy-0.14.2.tar.gz')
md5sums=('1447b90982f958dbddff2f02bd9f299a')

build() {
    cd $srcdir/MongoAlchemy-$pkgver
    sudo pip2 install --no-deps . 

}

