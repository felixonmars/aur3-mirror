# Maintainer: Kazuo Teramoto <kaz.rag at gmail.com>
pkgname=zsh-git-git
pkgver=20110906
pkgrel=1
pkgdesc="wunjo git-enabled zsh prompt"
arch=(any)
url="http://www.wunjo.org/zsh-git"
license=('GPL')
depends=('zsh')
makedepends=('git')

_gitroot="https://github.com/jcorbin/zsh-git.git"
_gitname="zsh-git"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
}

package() {
  cd "$srcdir/$_gitname-build"
  install -d "$pkgdir/usr/share/zsh/site-functions"
  cp functions/* "$pkgdir/usr/share/zsh/site-functions"
  install -d "$pkgdir/usr/share/doc/zsh-git"
  cp {README,TODO,zshrc} "$pkgdir/usr/share/doc/zsh-git"
} 
