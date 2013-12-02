# Maintainer: William Giokas <1007380@gmail.com>

pkgname=python-pywer-git
_pkgname=pywer
pkgver=0.12.r0.g3ae8a07
pkgrel=1
pkgdesc='A simple python-based AUR helper'
url='http://git.kaictl.net/wgiokas/pywer.git'
license=('MIT')
arch=('any')
provides=('python-pywer')
conflicts=('python-pywer')
makedepends=('python-setuptools' 'git')
depends=('python-requests' 'python-xdg' 'pyalpm')
source=("git+git://git.kaictl.net/wgiokas/pywer.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --tags --long | sed -E 's/([^-]+-g)/r\1/;s/-/./g;s/^v//g' 
}
prepare() {
  cd "$srcdir/$_pkgname"
  sed -i -E "s/(.*__version__ = ).*/\1'$pkgver'/g" libaur/__init__.py
}

check() {
  cd "$srcdir/$_pkgname"
  ./setup.py -q test -v
}

package() {
  cd "$srcdir/$_pkgname"
  ./setup.py -q install --prefix=/usr --root="$pkgdir"
  install -Dvm 644 _pywer "$pkgdir/usr/share/zsh/site-functions/_pywer"
}
