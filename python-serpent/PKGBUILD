pkgbase=('python-serpent')
pkgname=("$pkgbase" 'python2-serpent')
pkgver=1.11
pkgrel=1
pkgdesc='Serializer for literal Python expressions, also .NET and Java'
url='https://pypi.python.org/pypi/serpent'
arch=('any')
license=('MIT')
depends=('python' 'python2')
source=("https://github.com/irmen/Serpent/archive/v$pkgver.tar.gz")
md5sums=('375ff73ee9b3bbdbfdbedb11155a6172')

package_python2-serpent() {
    depends=('python2')
    cd "Serpent-$pkgver"
    python2 setup.py install --root="$pkgdir"
}

package_python-serpent() {
    depends=('python')
    cd "Serpent-$pkgver"
    python setup.py install --root="$pkgdir"
}
