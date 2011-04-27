# Maintainer: Kevin Berry <kb@rubyists.com>
pkgname='runit-services-git'
pkgver=20110427
pkgrel=2
arch=('x86_64' 'i686')
pkgdesc="A collection of commonly used service directories"
url="http://github.com/rubyists/runit-services"
license=('custom')
provides=('runit-services')
depends=('runit')
makedepends=('git')
optdepends=('socklog-dietlibc: advanced logging system' 'runit-services: a collection of commonly used service directories')
source=('COPYRIGHT' "README.md")
md5sums=('69ec4109404fce21737ac93f9d844d49'
         'ab40e7102f73fc1a0482da8fdd32c137')

_gitroot="https://github.com/rubyists/runit-services.git"
_gitname="runit-services"

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

}

package() {
  cd "$srcdir/$_gitname-build/"
  install -D -d "$pkgdir/etc/sv"
  for service in etc/sv/*;do
    cp -a $service "$pkgdir/etc/sv/"
  done
} 
