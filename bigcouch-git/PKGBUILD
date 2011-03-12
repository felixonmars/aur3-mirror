# Maintainer: TJ Vanderpoel <tj@rubyists.com>
pkgname=bigcouch-git
pkgver=20110311
pkgrel=4
pkgdesc="A highly available, fault-tolerant, clustered, mostly api-compliant version of Apache CouchDB."
arch=(i686 x86_64)
url="https://github.com/cloudant/bigcouch"
license=('Apache 2')
depends=(runit erlang spidermonkey icu curl openssl)
makedepends=('git' 'python2')
provides=(couchdb)
conflicts=(couchdb)
replaces=(couchdb)
source=(bigcouch.sv.run bigcouch.sv.log bigcouch.env.home)
install=bigcouch.install
md5sums=('4f8419673274eeb017e10bf6b3bc0dae'
         'd6f6a1c30590f99092899338c799e59e'
         '211538e6bdb2f857309cb6b99c00bb1f')

_gitroot="https://github.com/cloudant/bigcouch.git"
_gitname="bigcouch"

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
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #

  ./configure -p /var/lib/bigcouch
  sed -i -e 's/python/python2/' Makefile
  make
  make dist
}

package() {
  cd "$srcdir/$_gitname-build"
  install -d "$pkgdir/var/lib" "$pkgdir/var/log/bigcouch" "$pkgdir/etc"
  cp -a rel/bigcouch "$pkgdir/var/lib/"
  rmdir "$pkgdir/var/lib/bigcouch/var/log"
  ln -s /var/log/bigcouch "$pkgdir/var/lib/bigcouch/var/log"
  mv "$pkgdir/var/lib/bigcouch/etc" "$pkgdir/etc/bigcouch"
  ln -s /etc/bigcouch "$pkgdir/var/lib/bigcouch/etc"
  install -m 0755 -D "$srcdir/bigcouch.sv.run" "$pkgdir/etc/sv/bigcouch/run"
  install -m 0755 -D "$srcdir/bigcouch.sv.log" "$pkgdir/etc/sv/bigcouch/log/run"
  install -m 0644 -D "$srcdir/bigcouch.env.home" "$pkgdir/etc/sv/bigcouch/env/HOME"
} 
