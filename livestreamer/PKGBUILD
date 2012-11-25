# Maintainer: Christopher Rosell <chrippa@tanuki.se>
pkgname=livestreamer
pkgver=1.4
pkgrel=1
pkgdesc='CLI program that launches streams from various streaming services in a custom video player'
arch=('i686' 'x86_64')
url='https://github.com/chrippa/livestreamer'
license=('BSD')
groups=()
depends=('python' 'python-sh' 'python-requests' 'rtmpdump-git')
makedepends=('python-distribute')
provides=('livestreamer')
conflicts=('livestreamer-git')
replaces=()
backup=()
options=(!emptydirs)
install=
source=(http://pypi.python.org/packages/source/l/livestreamer/livestreamer-$pkgver.tar.gz)
md5sums=('445c0cc7c6093185e004c0d6033c1c5f')

package() {
  cd "$srcdir/livestreamer-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
