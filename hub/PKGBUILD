# Maintainer: Alfredo Palhares <masterkorp@masterkorp.net>

pkgname=hub
pkgver=1.10.2
pkgrel=1
pkgdesc="hub introduces git to GitHub"
arch=('any')
url="http://defunkt.io/hub"
depends=('git' 'ruby')
makedepends=('ruby')
license=('MIT')
groups=()
source=(https://github.com/defunkt/hub/tarball/v$pkgver)
md5sums=('12357b7542d1caf4ec049343e8564057')

build() {
  workdir=$srcdir/defunkt-hub*
  cd $workdir
  printf $workdir
  rake standalone
  gzip --best -c man/hub.1> hub.1.gz
}

package() {
  workdir=$srcdir/defunkt-hub*
  cd $workdir
  printf $workdir
  install -D -m755 hub $pkgdir/usr/bin/$pkgname
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  mkdir -p $pkgdir/usr/share/man/man1/
  install -D -m644 hub.1.gz $pkgdir/usr/share/man/man1/
}
