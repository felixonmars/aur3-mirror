# Maintainer: Andreas B. Wagner <AndreasBWagner@pointfree.net>
_pkgname=dmc
pkgname=${_pkgname}-git
pkgver=20121224
pkgrel=3
pkgdesc="dynamic mail client"
arch=('i686' 'x86_64')
url="http://git.suckless.org/dmc/"
license=('MIT')
groups=()
depends=('msmtp' 'openssl')
makedepends=('git')
provides=($_pkgname)
conflicts=($_pkgname)
replaces=('dmc-hg')
backup=()
options=()
install=
noextract=()
source=("$pkgname::git://git.suckless.org/$_pkgname")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  echo $(git describe --tags | sed 's#-#_#g;s#v##')
}

build() {
  cd "$srcdir/$pkgname"
  make -j1 LDFLAGS=-Wl,-O1,--sort-common,--no-as-needed,-z,relro PREFIX=/usr all
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
