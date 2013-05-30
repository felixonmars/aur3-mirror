pkgname=python2-flask-mongoalchemy
pkgver=0.5.4
pkgrel=1
pkgdesc="Add Flask support for MongoDB using MongoAlchemy"
url="http://packages.python.org/Flask-MongoAlchemy/"
depends=('python2' 'python2-mongoalchemy')
makedepends=('python2-distribute' 'python2-pip')
license=('BSD')
arch=('any')
source=("http://pypi.python.org/packages/source/F/Flask-MongoAlchemy/Flask-MongoAlchemy-${pkgver}.tar.gz")
md5sums=('03afb3f2c5548146a56dcd8c79ce5f91')

build() {
    cd "$srcdir/Flask-MongoAlchemy-${pkgver}"
    sudo pip2 install --no-deps . 

}

