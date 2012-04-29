# Maintainer: James McGlashan (archeyDevil)
#   <james.mcglashan@affinityvision.com.au>

pkgname=omz-archey-extra-git
pkgver=20120430
pkgrel=1
pkgdesc="40+ plugins for omz on the aur. oh-my-zsh."
arch=('any')
url="http://github.com/archeydevil/oh-my-zsh-extra"
license=('MIT')
depends=('omz-archey-git')
makedepends=('git')

# Cleaner _git format
_gitdomain='github.com'
_gituser='archeydevil'
_gitname='oh-my-zsh-extra'
_gitroot="https://$_gitdomain/$_gituser/$_gitname.git"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server.... [$_gitdomain:$_gituser:$_gitname]"
  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone --depth=1 $_gitroot $_gitname
  fi
  msg "GIT checkout done or server timeout"
}

package() {
  install -d "$pkgdir/usr/share/oh-my-zsh"
  cp -r oh-my-zsh-extra/* "$pkgdir/usr/share/oh-my-zsh"
}

# vim:set ts=2 sw=2 et:
