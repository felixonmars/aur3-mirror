# Maintainer: Daniel T. Borelli < daltomi at aol >

pkgname=viewpart
pkgver=1.0
pkgrel=1
pkgdesc="Explore particiones en archivos de imagen de disco."
arch=('i686' 'x86_64')
url='https://gitorious.org/viewpart'
license=('GPL2')
depends=('fox-devel' 'libutil-linux')
makedepends=('git' 'cmake')
_gitroot='git://gitorious.org/viewpart/viewpart.git'
_gitname='viewpart'
md5sums=('skip')

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" --depth=1 --single-branch "$_gitname"
  fi

  msg "GIT checkout done or server timeout"

  src_git=$srcdir/$_gitname/

#Build  
  msg "Starting build..."
  cd $src_git/
  cmake . && make 
}

package() {
  install -Dm755 "$srcdir/$_gitname/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
