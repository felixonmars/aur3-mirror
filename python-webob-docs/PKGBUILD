# Maintainer: Aaron DeVore <aaron.devore@gmail.com>
# Contributor: Cilyan Olowen <gaknar@gmail.com>
pkgname='python-webob-docs'
pkgver='1.4'
pkgrel='1'
pkgdesc="WSGI request and response object"
arch=('any')
url="http://pythonpaste.org/webob/"
license=('MIT')
makedepends=('python2-setuptools' 'python2-sphinx')
changelog='Changelog'
source=("http://pypi.python.org/packages/source/W/WebOb/WebOb-${pkgver}.tar.gz")
md5sums=('8437607c0cc00c35f658f972516ffb55')

build() {
  cd "$srcdir/WebOb-${pkgver}"
  python2 setup.py build_sphinx 
}

package() {
  cd "$srcdir/WebOb-${pkgver}"
  _doc_dir="$pkgdir/usr/share/docs/python-webob"
  mkdir -p "$_doc_dir"
  cp -a "build/sphinx/html" "$_doc_dir"
  chmod -R 644 "$_doc_dir"
  install -D -m644 "docs/license.txt" \
                   "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}

