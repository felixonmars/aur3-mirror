# Maintainer: Patrice Peterson <runiq at archlinux dot us>
# Contributor: avb <benvb92 at gmail dot com>

pkgname=virtualfish-git
_pkgname=virtualfish
pkgver=r105.10d51f9
pkgrel=1
pkgdesc="A Fish wrapper for Ian Bicking's virtualenv, based loosely on Doug Hellman's virtualenvwrapper for Bash"
arch=('any')
url="http://virtualfish.readthedocs.org"
license=('custom')
depends=('fish' 'python2-pip')
makedepends=('git' 'python2-sphinx')
provides=('virtualfish')
conflicts=('virtualfish')
source=("git+https://github.com/adambrenecki/virtualfish")
install=${_pkgname}.install
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname/docs"
  make SPHINXBUILD=sphinx-build2 man
}

package() {
  cd "$_pkgname"
  install -Dm0644 docs/_build/man/virtualfish.1 "$pkgdir/usr/share/man/man1/virtualfish.1"
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm0644 virtualfish/virtual.fish "$pkgdir/usr/share/$_pkgname/virtual.fish"
  install -Dm0644 virtualfish/auto_activation.fish "$pkgdir/usr/share/$_pkgname/auto_activation.fish"
  install -Dm0644 virtualfish/compat_aliases.fish "$pkgdir/usr/share/$_pkgname/compat_aliases.fish"
  install -Dm0644 virtualfish/global_requirements.fish "$pkgdir/usr/share/$_pkgname/global_requirements.fish"
  install -Dm0644 virtualfish/projects.fish "$pkgdir/usr/share/$_pkgname/projects.fish"
}

# vim:set ts=2 sw=2 et: 
