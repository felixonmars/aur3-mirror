# Maintainer: fnord0 <fnord0 AT riseup DOT net>
pkgname=python2-yara
pkgbase=yara-python
pkgver=1.6
pkgrel=1
epoch=
pkgdesc="python(2) yara bindings - yara = a malware identification and classification tool"
url="http://code.google.com/p/yara-project/"
arch=('x86' 'x86_64')
license=('APACHE')
depends=('python2')
options=(!emptydirs)
source=("http://yara-project.googlecode.com/files/yara-python-${pkgver}.tar.gz")
md5sums=('bff290f777dc8434575187e5d44f5e87')

package() {
  cd "$srcdir/$pkgbase-$pkgver"
  python2 setup.py build
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
