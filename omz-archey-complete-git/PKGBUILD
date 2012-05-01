# Maintainer: Daniel Wallace <daniel.wallace at gatech dot edu>
# Contributor: James McGlashan (archeyDevil)
#   <james.mcglashan@affinityvision.com.au>

pkgbase=omz-archey-complete-git
pkgname=omz-archey-complete-git
true && pkgname=('omz-archey-git' 'omz-archey-extra-git')
pkgver=20120501
pkgrel=1
arch=('any')
url="http://github.com/archeydevil/oh-my-zsh"
license=('unknown')

# Cleaner _git format
_gitdomain='github.com'
_gituser='archeydevil'
_gitname='oh-my-zsh'
_gitname2='oh-my-zsh-extra'
_gitbranch='master' # (master/sorin)
_gitroot="https://$_gitdomain/$_gituser/$_gitname.git"
_gitroot2="https://$_gitdomain/$_gituser/$_gitname2.git"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server.... [$_gitdomain:$_gituser:$_gitname:$_gitbranch]"
  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    git checkout $_gitbranch
    msg "The local files are updated."
  else
    git clone --depth=0 $_gitroot $_gitname --branch $_gitbranch
  fi
  if [ -d $_gitname2 ] ; then
    cd $_gitname2 && git pull origin
    git checkout $_gitbranch
    msg "The local files are updated."
  else
    git clone --depth=1 $_gitroot2 $_gitname2 
  fi

  msg "GIT checkout done or server timeout"
}

package_omz-archey-git() {
  pkgdesc="A handful of functions, auto-complete helpers, and stuff that makes you shout. Note, this is a fork of the official oh-my-zsh, the main goal was to get a system-wide patch, however improved lots more."
  depends=('zsh>=4.3.9')
  makedepends=('git')
  optdepends=('python' 'curl' 'git' 'pkgtools' 'python-pygments')
  install='omz.install'
  conflicts=('grml-zsh-config')
  install -d "$pkgdir/usr/share/oh-my-zsh"
  cp -a oh-my-zsh/* "$pkgdir/usr/share/oh-my-zsh"

  mkdir -p "$pkgdir/usr/share/zsh/site-functions"
  cp "$pkgdir/usr/share/oh-my-zsh/omz" "$pkgdir/usr/share/zsh/site-functions/"
}
package_omz-archey-extra-git() {
  pkgdesc="40+ plugins for omz on the aur. oh-my-zsh."
  arch=('any')
  url="http://github.com/archeydevil/oh-my-zsh-extra"
  license=('MIT')
  depends=('omz-archey-git')
  install -d "$pkgdir/usr/share/oh-my-zsh"
  cp -r oh-my-zsh-extra/* "$pkgdir/usr/share/oh-my-zsh"
}

# vim:set ts=2 sw=2 et:
