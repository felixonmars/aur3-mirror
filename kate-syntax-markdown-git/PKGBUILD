# Maintainer: iruel (Tenshi Hinanawi) <cockmomgler@gmail.com>
pkgname=kate-syntax-markdown-git
pkgver=20120916
pkgrel=1
pkgdesc="Markdown syntax highlighting for the KDE Katepart."
arch=('any')
url="https://github.com/treeofsephiroth/kate-markdown"
license=('GPL' 'BSD')
groups=()
depends=()
makedepends=('git')
noextract=()
#md5sums=() #generate with 'makepkg -g'

_gitroot=git://github.com/treeofsephiroth/kate-markdown.git
_gitname=kate-markdown

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

}

package() {
  cd "$srcdir/$_gitname-build"
  mkdir -p $pkgdir/usr/share/apps/katepart/syntax/
  cp markdown.xml $pkgdir/usr/share/apps/katepart/syntax/markdown.xml
}

# vim:set ts=2 sw=2 et: