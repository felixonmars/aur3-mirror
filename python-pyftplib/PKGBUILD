#Maintainer: Gustavo Alvarez <sl1pkn07@gmaul.com>

pkgname=python-pyftplib
pkgver=1.2.0
pkgrel=1
pkgdesc="Python FTP server library"
arch=('any')
url="http://code.google.com/p/pyftpdlib/"
license=('MIT')
depends=('python-pyopenssl')
source=("https://pyftpdlib.googlecode.com/files/pyftpdlib-${pkgver}.tar.gz")
md5sums=('65f2b2cea84d9110fe929ef38db79dbb')

prepare() {
  rm -fr pyftpdlib
  mv "pyftpdlib-${pkgver}" pyftpdlib
}

build() {
  cd pyftpdlib
  python setup.py build
}

check() {
  pushd "${srcdir}/pyftpdlib/build/lib" > /dev/null
  for i in "${srcdir}/pyftpdlib/test/"{test_ftpd.py,test_contrib.py}; do python2 "${i}"; done
}

package(){
  cd pyftpdlib

  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}