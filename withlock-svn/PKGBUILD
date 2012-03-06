# Maintainer: Dominik Heidler <dheidler@gmail.com>

pkgname=withlock-svn
pkgver=20120306
pkgrel=1
pkgdesc="A locking wrapper script"
arch=('any')
url="http://code.google.com/p/withlock/"
license=('Apache')
groups=()
depends=('python2')
makedepends=('curl' 'sed')
provides=('withlock')
source=()
md5sums=()

_svnurl="http://withlock.googlecode.com/svn/trunk/withlock"

build() {
  cd "$srcdir"
  msg "Connecting to HTTP server...."

  curl "$_svnurl" > withlock

  msg "Download done or server timeout"
  msg "Starting make..."

  sed -i "s|#!/usr/bin/env python$|#!/usr/bin/env python2|" withlock
}
package() {
  cd "$srcdir"
  install -Dm 755 withlock /usr/bin/withlock
} 
