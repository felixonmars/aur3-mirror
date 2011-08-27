# Contributor: Igor Brkic <igor at hyperglitch dot com>
# Maintainer: Igor Brkic <igor at hyperglitch dot com>
pkgname=rwma
pkgver=0.14
pkgrel=1
pkgdesc="Modular system for adding various keyboard driven actions to window manager."
arch=(any)
url="http://hyperglitch.com/dev/rwma"
license=('GPL')
depends=('ruby>=1.8.7')
makedepends=()
optdepends=('mechanize: Ruby gem necessary for EUdict plugin (gem install mechanize)')
source=(http://f.hyperglitch.com/rwma/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('86ab601b64fc17a616aa19e0be0302c7')
build() {
  cd "$srcdir/$pkgname-$pkgver" || return 1
  mkdir -p $pkgdir/usr/share/rwma || return 1
  mkdir -p $pkgdir/usr/bin || return 1
  mkdir -p $pkgdir/usr/share/man/man1 || return 1
  cp -r modules $pkgdir/usr/share/rwma/ || return 1
  cp rwma $pkgdir/usr/bin/ || return 1
  chmod a+x $pkgdir/usr/bin/rwma || return 1
  cp rwma-command $pkgdir/usr/share/rwma/ || return 1
  cp COPYING $pkgdir/usr/share/rwma/ || return 1
  cp README $pkgdir/usr/share/rwma/ || return 1
  cp rwma.yaml.sample $pkgdir/usr/share/rwma/ || return 1
  cp rwma.1.gz $pkgdir/usr/share/man/man1/ || return 1
}
# vim:set ts=2 sw=2 et:
