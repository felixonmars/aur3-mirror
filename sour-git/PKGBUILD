# Maintainer: Bryan Garza <brygarza@gmail.com>
pkgname=sour-git
pkgver=20120413
pkgrel=1
pkgdesc="bash script to automate screenshot uploading"
arch=(any)
url="https://github.com/wolfcore/sour"
license=('GPL')
depends=('bash' 'curl' 'imagemagick' 'scrot')
makedepends=('git')
optdepends=('xclip: copy url to clipboard')

_gitroot='git://github.com/wolfcore/sour.git'
_gitname='sour'
_gitbranch='master'

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

  # Create pkgdir folders
  install -d $pkgdir/usr/bin

  # Install
  cp -r sour $pkgdir/usr/bin/sour

}

# vim:set ts=2 sw=2 et:
