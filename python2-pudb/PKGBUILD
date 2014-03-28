# Maintainer: Kwpolska <kwpolska@kwpolska.tk>
pkgname=python2-pudb
pkgver=2014.1
pkgrel=1
pkgdesc="A full-screen, console-based Python debugger"
url="http://pypi.python.org/pypi/pudb"
arch=('any')
license=('custom: MIT')
depends=('python2' 'python2-urwid' 'python2-pygments')
source=("http://pypi.python.org/packages/source/p/pudb/pudb-${pkgver}.tar.gz")
md5sums=('8104db184c9553c568966cd67a7b1b2f')

package() {
  cd "${srcdir}/pudb-${pkgver}"
  python2 setup.py install --root="${pkgdir}"
  install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: set ft=sh ts=2 sw=2 et:
