# Maintainer: Eric Liu <eric@hnws.me>
pkgname=python2-derpconf
relname=derpconf
pkgver=0.6.0
pkgrel=1
pkgdesc="derpconf abstracts loading configuration files for your app."
arch=('any')
url="https://github.com/globocom/derpconf"
license=('MIT')
groups=()
depends=('python2')
makedepends=()
provides=('python2-derpconf')
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://github.com/globocom/$relname/archive/$pkgver.tar.gz")
md5sums=('bc6acc5050e5b09e578b2969db01fb0f')

package() {
  tar xzf "$pkgver.tar.gz"
  cd "$srcdir/$relname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
