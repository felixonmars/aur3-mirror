# Maintainer: John Reese <john@noswap.com>
# Upstream URL: https://github.com/jreese/ircstat
#
# For improvements/fixes to this package, please send a pull request:
# https://github.com/jreese/arch


pkgname=ircstat-git
pkgver=20131005
pkgrel=1
pkgdesc="generate statistics and graphs from IRC channel logs"
arch=('any')
url="https://github.com/jreese/ircstat"
license=('MIT')
depends=('python-setuptools' 'python-matplotlib')
makedepends=('git')

_gitroot="git://github.com/jreese/ircstat.git"
_gitname="ircstat"

source=("$_gitroot")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  git log -1 --format="%cd" --date=short | sed 's|-||g'
}

package() {
  cd "$srcdir/$_gitname"
  python setup.py install --root="$pkgdir/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
