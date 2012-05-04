# Maintainer: Your Name <youremail@domain.com>
pkgname=gt
pkgver=1
pkgrel=1
pkgdesc="gt- A Google Tasks client"
arch=(any)
url="https://github.com/MikeEcho/gt"
license=('GPL')
groups=()
depends=('python2-gflags' 'python2-httplib2' 'python2-oauth2' 'python2-google-api-client')
makedepends=('git')
optdepends=()
provides=('gt')
conflicts=('gt')

_gitroot="git://github.com/MikeEcho/gt.git"
_gitname="gt"

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

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
  
  cd "$srcdir/$_gitname-build"
  install -D -m755 gt ${pkgdir}/usr/bin/gt

}
