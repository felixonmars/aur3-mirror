# Maintainer: Andrey Mikhaylenko <neithere at gmail dot com>
# Contributor: Moritz Lipp <mlq@pwmt.org>
_python=python
_distname=timetra.pim
pkgname=$_python-timetra-pim
pkgver=0.0.2
pkgrel=2
pkgdesc="Personal Information Tracker with YAML backend + CLI frontend"
arch=(any)
url="http://github.com/neithere/timetra.pim"
license=('LGPL3')
depends=(
  'python-argh>=0.24'
  'python-blessings>=1.5',
  'python-confu>=0.0.1'
  'python-flask>=0.10.1',
  'python-monk>=0.11.2'
  'python-prettytable>=0.7.2'
  'python-dateutil>=2.2'
  'python-yaml>=3.10'
  'python-xdg>=0.25',
)
optdepends=(
  'python-urwid: experimental curses-based TUI'
  'python-argcomplete: bash completion'
)
makedepends=('python-distribute')
source=("http://pypi.python.org/packages/source/${_distname:0:1}/$_distname/$_distname-$pkgver.tar.gz")
md5sums=('fd56ba6ae81915076f19e3568dc30153')

package() {
  cd "$srcdir/$_distname-$pkgver"
  $_python setup.py install --root="$pkgdir" --optimize=1
}
