# Contributor: matt <matthewhague@zoho.com>
# Based on rich_o's <rich_o@lavabit.com> ncmpcpp-git PKGBUILD

pkgname=ncmpcpp-git-mtime-sort
pkgver=20120620
pkgrel=8
pkgdesc="Ncmpcpp with mtime sorting. MERGED INTO ncmpcpp-git 20-09-2012."
arch=('i686' 'x86_64')
url="http://unkart.ovh.org/ncmpcpp/"
license=('GPL2')
depends=('ncurses' 'libmpdclient>=2.1')
makedepends=('git')
optdepends=('curl: fetch lyrics'
'taglib: tag editor'
'fftw: frequency spectrum mode visualization')
conflicts=('ncmpcpp' 'ncmpcpp-git')
install=${pkgname}.install

_gitroot="https://github.com/yourealwaysbe/ncmpcpp-mtime.git"
_gitname="ncmpcpp-mtime"

build() {
  cd "$srcdir"
  msg "Connecting to github..."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin master
    msg "The local files are updated."
  else
    git clone $_gitroot
    cd $_gitname
  fi
    
  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  ./autogen.sh --prefix=/usr \
  --enable-clock \
  --enable-outputs \
  --enable-visualizer || return 1
  make || return 1
  make DESTDIR="$pkgdir/" install
} 
