# Maintainer: Myles English <myles at rockhead dot biz>
pkgname=git-subtree-git
pkgver=20101210
pkgrel=1
pkgdesc="An experimental alternative to the git-submodule command. Merges and splits subtrees from your project into subprojects and back."
arch=('any')
url="http://github.com/apenwarr/git-subtree"
license=('unknown')
groups=()
depends=('git')
makedepends=('git' 'asciidoc' 'xmlto')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_gitroot="https://github.com/apenwarr/git-subtree.git"
_gitname="git-subtree"

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
  chmod +x *.sh

  make doc
}

package() {
  cd "$srcdir/$_gitname-build"

  pkgInstallPath="${pkgdir}$(git --exec-path)"

  mkdir -p "${pkgInstallPath}"
  cp git-subtree.sh "${pkgInstallPath}"/git-subtree

  mkdir -p "${pkgdir}"/usr/share/man/man1
  cp git-subtree.1 "${pkgdir}"/usr/share/man/man1/
} 
