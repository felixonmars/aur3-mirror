# Maintainer: Schnouki <thomas.jost@gmail.com
pkgname=pysieved-git
pkgver=20100313
pkgrel=1
pkgdesc="Python MANAGESIEVE server for Postfix, Exim and others."
arch=('any')
url="http://gitorious.org/pysieved/pages/Home"
license=('GPL3')
depends=('python')
makedepends=('git')
optdepends=('python-tlslite: for TLS support')
provides=('pysieved')
conflicts=('pysieved')
backup=('etc/pysieved.ini')
source=("pysieved.rc")
md5sums=('c2af637e570aa909f942ada0084d519f')
sha1sums=('984ae7e8d489c704072182f5fda9e6e2ada4c4fc')

_gitroot="git://gitorious.org/pysieved/pysieved.git"
_gitname="pysieved"

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
  msg "Starting install..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #

  # init script and configuration file
  install -Dm755 "$srcdir/pysieved.rc" "$pkgdir/etc/rc.d/pysieved" || return 1
  install -Dm644 "$srcdir/$_gitname-build/pysieved.ini" "$pkgdir/etc/pysieved.ini" || return 1
  

  # move to /usr/lib
  rm -rf "$srcdir/$_gitname-build/.git"
  install -dm755 "$pkgdir/usr/lib" || return 1
  mv "$srcdir/$_gitname-build" "$pkgdir/usr/lib/pysieved"
} 
