# Contributor: Andrei "Garoth" Thorp <my-username at gmail dot com>
pkgname=git-rank-contributors
pkgver=1.0
pkgrel=1
pkgdesc="Goes through git logs and ranks contributors by diff size."
arch=('i686' 'x86_64')
url="http://git-wt-commit.rubyforge.org/"
license=('GPL')
depends=('ruby' 'git')
source=(http://git-wt-commit.rubyforge.org/${pkgname})
noextract=(${pkgname})
md5sums=('3c0329c17a6344849e75551b50b8f30f')

build() {
  install -D ${pkgname} ${pkgdir}/usr/lib/git-core/${pkgname}
}

# vim:set ts=2 sw=2 et:
