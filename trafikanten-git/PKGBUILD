# Maintainer: Alexander Rødseth <rodseth@gmail.com>

pkgname=trafikanten-git
pkgver=20110829
pkgrel=1
pkgdesc='CLI interface to trafikanten.no'
url='https://github.com/tfheen/trafikanten-cli'
arch=('any')
license=('BSD')
makedepends=('git')
depends=('perl' 'perl-json' 'perl-config-file-svn')
source=("trafikanten::git://github.com/tfheen/trafikanten-cli.git")
md5sums=('SKIP')

package() {
  cd "${pkgname/-git}"

  install -Dm755 trafikanten "$pkgdir/usr/bin/trafikanten"
  install -Dm644 README \
    "$pkgdir/usr/share/doc/$pkgname/README"
  install -Dm644 COPYING \
    "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
