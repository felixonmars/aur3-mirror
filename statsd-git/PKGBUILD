# Maintainer: Sid Karunaratne <sid at karunaratne dot net>
pkgname=statsd-git
pkgver=20130408
pkgrel=1
pkgdesc="a network daemon for aggregating statistics (counters and timers), rolling them up, then sending them to graphite"
arch=('i686' 'x86_64')
url="https://github.com/etsy/statsd"
license=('MIT')
depends=(nodejs)
makedepends=(git)
source=(statsd.service)
sha256sums=('7a8d431bfbc386b7d66314c32cd26e52ff6353c767f75bd8e2f1a2aa98e4dc55')
install=install

_gitroot="git://github.com/etsy/statsd.git"
_gitname="statsd"

pkgver() {
  cd "$srcdir/$_gitname"
  git log -1 --format="%cd" --date=short | tr -d '-'
}

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

  cd "$srcdir/$_gitname"

  npm install nodeunit
  npm install temp
  npm install underscore
}


package() {
  mkdir -p "${pkgdir}/opt/"
  cp -r "${_gitname}" "${pkgdir}/opt/"
  rm -rf "${pkgdir}/opt/statsd/.git" "${pkgdir}/opt/statsd/.gitignore"
  install -Dm 644 statsd.service "${pkgdir}/usr/lib/systemd/system/statsd.service"
}
