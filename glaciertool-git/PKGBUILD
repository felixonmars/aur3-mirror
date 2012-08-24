# Maintainer: Justin Gottula <justin@jgottula.com>
pkgname=glaciertool-git
pkgver=20120824
pkgrel=1
pkgdesc="Tool for uploading and managing archives in Amazon Glacier"
arch=('i686' 'x86_64')
url="https://github.com/jgottula/GlacierTool"
license=('BSD')
groups=()
depends=()
makedepends=('make' 'mono')
provides=('glaciertool')
conflicts=('glaciertool')
replaces=()
backup=()
options=()
install='glaciertool.install'
source=('glaciertool.sh')
noextract=()
sha256sums=('e5d0e1cb4082f598ff7ca4700873f48b1c0bd936daacbc800c7be0f461269cf7')

_gitroot='git://github.com/jgottula/GlacierTool.git'
_gitname='GlacierTool'

# change this if you'd like to build a different branch
_gitbranch='master'

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin $_gitbranch
    msg "The local files are updated."
  else
    git clone -b $_gitbranch "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  make clean all
}

package() {
  install -Dm 755 "$srcdir/glaciertool.sh" "$pkgdir/usr/bin/glaciertool"

  install -Dm 755 "$srcdir/$_gitname-build/AWSSDK.dll" "$pkgdir/usr/share/glaciertool/AWSSDK.dll"
  install -Dm 755 "$srcdir/$_gitname-build/GlacierTool.exe" "$pkgdir/usr/share/glaciertool/"
}
