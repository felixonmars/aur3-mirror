# Contributor: Maurizio Porrato <maurizio.porrato@gmail.com>
pkgname=python-starpy
pkgver=1.0.0a13
pkgrel=2
pkgdesc="Twisted Protocols for interaction with Asterisk PBX"
license=('custom:"StarPy License"')
url="http://www.vrplumber.com/programming/starpy/"
source=("http://downloads.sourceforge.net/starpy/starpy-$pkgver.tar.gz")
md5sums=('00661caec56e54974a804daf5d2f172d')
arch=(any)
makedepends=('python2-distribute')
depends=('twisted' 'python-basicproperty')

build() {
  cd $srcdir/starpy-$pkgver
  python2 setup.py install --prefix=/usr --root=$startdir/pkg --optimize=1
  find $pkgdir -type d -name examples -or -name doc -or -name .svn | xargs rm -rf
  install -Dm 644 $srcdir/starpy-$pkgver/license.txt $pkgdir/usr/share/licenses/python-starpy/license
}
