# Maintainer: Kyrylo Silin <kyrylosilin@gmail.com>

pkgname=zsh-completion-subtle
pkgver=0.0.2
pkgrel=1
pkgdesc="Z Shell completion scripts for Subtle WM and its tools."
url="https://www.github.com/kyrylo/zsh-completion-subtle"
arch=('any')
license=('MIT License')
depends=('zsh')
makedepends=('git')

_gitroot="git://www.github.com/kyrylo/zsh-completion-subtle.git"
_gitrepo="zsh-completion-subtle"

build()
{
  cd "$srcdir"
  msg "Connecting to Git server..."

  if [ -d $_gitrepo ]; then
    cd $_gitrepo
    git pull origin || return 1
    msg "The local files are updated."
  else
    git clone --depth=1 $_gitroot $_gitrepo || return 1
  fi

  msg "Git checkout done or server timeout."
}

package()
{
  cd "$srcdir/$_gitrepo"
  install -m0755 -d "$pkgdir/usr/share/zsh/site-functions"
  install -m0644 _* "$pkgdir/usr/share/zsh/site-functions"
}
