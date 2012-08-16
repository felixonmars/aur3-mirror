# -*- shell-script -*-
# Maintainer: Eric Schulte <eric.schulte@gmx.com>
# Contributor: Eric Schulte <eric.schulte@gmx.com>
pkgname=org-merge-driver-git
pkgver=20120816
pkgrel=1
pkgdesc="Merge changes to Emacs Org-mode files"
arch=('i686' 'x86_64')
url="http://orgmode.org/worg/org-contrib/gsoc2012/student-projects/git-merge-tool/"
license=('GPL3')
makedepends=('git' 'autoconf' 'glibc')
provides=('org-merge-driver')

_gitroot="git://orgmode.org/org-merge-driver.git"
_gitname="org-merge-driver"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  ## Git checkout
  if [ -d $_gitname ] ; then
    pushd $_gitname && git pull origin && popd
  else
    git clone $_gitroot $_gitname
  fi
  msg "Checkout completed"

  ## Build
  msg "Building..."
  cd $_gitname
  autoreconf --install
  ./configure --prefix=/usr && make
}

package() {
  cd "$srcdir/"${_gitname}

  # Fix the paths in the documentation
  sed -i 's/\/usr\/local\/bin/\/usr\/bin/' README

  make DESTDIR="$pkgdir/" install

  # Revert to old paths for clean future git pulls
  sed -i 's/\/usr\/bin/\/usr\/local\/bin/' README
} 
