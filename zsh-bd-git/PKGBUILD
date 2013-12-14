# Maintainer: Fortunato Ventre (voRia) <vorione AT gmail DOT com>

pkgname=zsh-bd-git
_gitname=zsh-bd
pkgver=20131206
pkgrel=1
pkgdesc="Jump back to a specific directory, without doing `cd ../../..`"
license=('unknown')
arch=('any')
url="https://github.com/Tarrasch/zsh-bd"
depends=('zsh')
makedepends=('git')
source=('git://github.com/Tarrasch/zsh-bd.git')
md5sums=('SKIP')
install=zsh-bd-git.install

pkgver() {
  cd "$srcdir/$_gitname"
  git log -1 --format="%cd" --date=short | sed 's|-||g'
}

package() {
  cd "$srcdir/$_gitname"

  install -D -m 644 bd.zsh "$pkgdir/usr/share/zsh/plugins/bd.zsh"
  install -D -m 644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim:set ts=2 sw=2 et:
