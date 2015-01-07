# Maintainer: lykaner <grayfox@outerhaven.de>
# Contributor: lykaner <grayfox@outerhaven.de>

pkgname=keepassc-git
pkgver=1.7.0.r0.g9b134a1
pkgrel=1
pkgdesc="KeePassC is a curses-based password manager compatible to KeePass v.1.x and KeePassX"
arch=(any)
url="http://raymontag.github.com/keepassc/"
license=('GPL')
groups=
depends=('python-kppy>=1.4.0' 'python>=3.3')
optdepends=('xsel: copy usernames and password to clipboard'
	    'openssl: to create server certificates')
makedepends=('git')
provides=('keepassc')
conflicts=('keepassc' 'keepassc-dev')
source=("$pkgname"::'git://github.com/raymontag/keepassc.git#branch=development')

md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1
}

