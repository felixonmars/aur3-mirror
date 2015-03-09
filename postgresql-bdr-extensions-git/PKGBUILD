# Maintainer: Greg White <gwhite@kupulau.com> 
pkgname=postgresql-bdr-extensions-git
pkgver=20150308
pkgrel=7
pkgdesc="Postgres BDR extensions by awesome 2ndQuandrant"
arch=('i686' 'x86_64')
url="http://2ndquadrant.com/en/resources/bdr/"
license=('GPL')
depends=('libxml2' 'libxslt')
makedepends=('postgresql-bdr-git')
_gitroot="git://git.postgresql.org/git/2ndquadrant_bdr.git"
_gitname="postgresql"
_gitbranch="bdr-plugin/stable"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin $_gitbranch
    msg "The local files are updated."
  else
    git clone -b "$_gitbranch" "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone -b "$_gitbranch" "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  ./configure --prefix=/usr --enable-bdr=yes
  make
}

package() {
  cd "$srcdir/$_gitname-build"

  # install
  make DESTDIR="${pkgdir}" install
}
