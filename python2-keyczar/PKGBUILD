# Maintainer: Alireza Savand <alireza.savand@gmail.com>
# Contributors: 
#     * Devin Cook <devin.c.cook@gmail.com>
#     * Lex Black <autumn-wind at web dot de>

_pypkg="python-keyczar"
pkgname="python2-keyczar"
pkgver=0.71d
pkgrel=1.1
pkgdesc="Toolkit for safe and simple cryptography"
arch=('any')
url="http://www.keyczar.org"
license=('APACHE')
depends=('python2-crypto' 'python2-pyasn1')
source=("https://keyczar.googlecode.com/files/keyczar-python-${pkgver}-09062013.tar.gz")
sha1sums=('3126647aa712f2a15c20244947a1c13395f12020')


package() {
  cd "$srcdir/keyczar-python"
  python2 setup.py install --root=$pkgdir
}

