# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Stefan Seering <stefanarch@gmx.de>

_pkgname=git-dude
pkgname=git-dude-git
pkgver=r64.6a75703
pkgrel=1
pkgdesc="A simple git desktop notifier. It monitors git repositories in current directory for new commits/branches/tags and shows desktop notification if anything new arrived."
arch=('any')
url='https://github.com/sickill/git-dude'
license=('unknown')
depends=('git' 'libnotify')
source=("git://github.com/sickill/git-dude.git")
md5sums=('SKIP')


pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_pkgname"

  install -D -m755 git-dude $pkgdir/usr/bin/git-dude
  install -D -m644 LICENSE.txt $pkgdir/usr/share/licenses/git-dude/License
}

# vim:set ts=2 sw=2 et:
