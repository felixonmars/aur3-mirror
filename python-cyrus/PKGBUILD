pkgname=python-cyrus
pkgver=0.8.5
pkgrel=2
pkgdesc="Python bindings for cyrus imapd"
url="http://python-cyrus.sourceforge.net"
groups=(gnome2)
license=('GPL')
arch=('i686' 'x86_64')
depends=('python2>2.7' 'imap')
source=("http://ufpr.dl.sourceforge.net/project/python-cyrus/python-cyrus/latest/python-cyrus-0.8.5.tar.gz")
md5sums=('45b08fd0c9eabcdb025f6bb8043d6da8')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  echo "from cyruslib import *" > __init__.py
  echo "from sievelib import *" >> __init__.py
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p ${pkgdir}/usr/lib/python2.7/site-packages/cyruslib
  install * ${pkgdir}/usr/lib/python2.7/site-packages/cyruslib
  echo install in $pkgdir
}
