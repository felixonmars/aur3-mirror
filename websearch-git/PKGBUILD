# Contributor: Nathan Owe <ndowens.aur at gmail dot com>
pkgname=websearch-git
pkgver=20090718
pkgrel=1
pkgdesc="Is a simple script that allows immediate searches on internet"
arch=('i686' 'x86_64')
url="http://github.com/EstebanSannin/WebSearch/tree/master"
license=('GPL')
depends=('bash')
makedepends=('git')
conflicts=('websearch')
options=('!emptydirs')


_gitroot="git://github.com/EstebanSannin/WebSearch.git"
_gitname="WebSearch"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #

  install -d $pkgdir/usr/bin
  install -Dm755 websearch $pkgdir/usr/bin/websearch
} 
