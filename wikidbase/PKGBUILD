pkgname=wikidbase
pkgver=1.0.b1
pkgrel=1
pkgdesc="A highly flexible, easily-evolvable semi-structured database system, based on a wiki."
arch=('i686' 'x86_64')
license=('GPL')
url="http://projects.nickblundell.org.uk/wikidbase"
depends=('setuptools' 'python>=2.5' 'django>=0.96' 'python-pysqlite-legacy' 'pyparsing' 'docutils' 'nbdebug' 'parsedatetime')
source=(http://freshmeat.net/redir/wikidbase/69622/url_tgz/$pkgname-$pkgver.tar.gz)
md5sums=('4d49a2fcfbb8d706ce1fec4018faf842')

build() {
    cd $startdir/src/$pkgname-$pkgver
    python setup.py install --root=$startdir/pkg || return 1
}
