# Maintainer: Steven Hiscocks <steven _at_ hiscocks _dot_ me _dot_ uk>
pkgname=python2-pyjournalctl
pkgver=0.7.0
pkgrel=1
pkgdesc="A python module that reads systemd journal similar to journalctl"
arch=('i686' 'x86_64')
url="https://github.com/kwirk/pyjournalctl"
license=('LGPL2.1')
depends=('python2' 'systemd')
makedepends=('python2-distribute')
source=("http://pypi.python.org/packages/source/p/pyjournalctl/pyjournalctl-$pkgver.tar.gz")
md5sums=('956b9522e83a483678b607172fd65518')

build() {
  cd "$srcdir"/pyjournalctl-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
}
