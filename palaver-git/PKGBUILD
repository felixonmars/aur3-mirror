# Maintainer: thebeav <adam dot bevelhymer at gmail dot com>
# Contributor: Padfoot <padfoot at exemail dot com dot au>

pkgname=palaver-git
pkgver=20130417
pkgrel=1
pkgdesc="Speech recognition application to perform user customisable actions."
arch=('any')
url="https://github.com/JamezQ/Palaver"
license=('GPL3')
depends=('python2' 'espeak' 'mutt' 'sox' 'wget' 'xautomation' 'xvkbd' 'python2-notify' 'notification-daemon')
makedepends=('git')
source=('Palaver-ArchPatches.diff')
md5sums=('1498c110923b8d0c0a768ed4c6d49b5e')
install='palaver-git.install'

_gitroot='https://github.com/JamezQ/Palaver'
_gitname='Palaver'

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone -b master "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
  rm -rf "$srcdir/$_gitname-build/.git"
  rm "$srcdir/$_gitname-build/.gitignore"
  
  find $srcdir/$_gitname-build -type f -exec sed -i 's/python/python2/g' '{}' \;
  patch -p1 -i "$srcdir/Palaver-ArchPatches.diff"
  
  $srcdir/$_gitname-build/setup
}

package() {
  mkdir -p $pkgdir/opt/$_gitname

  cp -r $srcdir/$_gitname-build/* $pkgdir/opt/$_gitname
  chmod -R 777 $pkgdir/opt/$_gitname
}
