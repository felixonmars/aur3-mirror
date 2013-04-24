# Maintainer: Steven Hiscocks <steven _at_ hiscocks _dot_ me _dot_ uk>
pkgname=python2-netsnmpagent
pkgver=0.4.3
pkgrel=1
pkgdesc="Facilitates writing Net-SNMP (AgentX) subagents in Python"
arch=('any')
url="https://github.com/pief/python-netsnmpagent"
license=('GPL3')
depends=('python2' 'net-snmp')
makedepends=('python2-distribute')
source=("http://pypi.python.org/packages/source/n/netsnmpagent/netsnmpagent-${pkgver}.tar.gz")
md5sums=('f9e86bdb370f42e09e1f3ad53ee85f74')

package() {
  cd "$srcdir"/netsnmpagent-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
}
