# Contributor:  apkawa <apkawa@gmail.com>
pkgname=python-creoleparser
pkgver=0.7.4
pkgrel=1
pkgdesc="Parser for the Creole common wiki markup language"
arch=('i686' 'x86_64')
url="http://creoleparser.googlecode.com/svn/docs/index.html"
license=('MIT')
depends=('python2' 'python-genshi')
makedepends=()
source=( "http://pypi.python.org/packages/source/C/Creoleparser/Creoleparser-${pkgver}.zip"	)

build() {
    cd Creoleparser-${pkgver}
    python2 setup.py install --root=$startdir/pkg && \
    install -D -m0644 LICENSE.txt $startdir/pkg/usr/share/licenses/python-creoleparser/LICENSE
}

md5sums=('9619057d20a53d440eb591c904d29791')
