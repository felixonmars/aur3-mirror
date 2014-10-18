# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Andrei "Garoth" Thorp <my-username at gmail dot com>

pkgname=git-wtf
pkgver=1.0
pkgrel=3
pkgdesc="Ease handling many git branches with tidy summaries of merges."
arch=('any')
url="http://masanjin.net/blog/label/git-wtf/"
license=('GPL')
depends=('ruby' 'git')
source=(https://gitorious.org/willgit/$pkgname/raw/7870c56ba83e47a932e05acae049fa248d071ca2:bin/$pkgname)
md5sums=('5b12e88ac267c4a76a74650546746841')


package() {
  install -D ${pkgname} ${pkgdir}/usr/lib/git-core/${pkgname}
}

# vim:set ts=2 sw=2 et:
