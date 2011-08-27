# Contributor: Ron Huang <ronhuang+aur at gmail dot com>
pkgname=fcgiwrap-git
pkgver=20100930
pkgrel=1
pkgdesc="Simple FastCGI wrapper for CGI scripts"
arch=('i686' 'x86_64')
url="http://github.com/gnosek/fcgiwrap/"
license=('MIT')
depends=('spawn-fcgi')
makedepends=('git' 'autoconf' 'automake' 'fcgi')
provides=('fcgiwrap')
conflicts=('fcgiwrap')
backup=('etc/conf.d/fcgiwrap')
install=fcgiwrap.install
source=(conf initscript)
md5sums=('2a4fa3e8a96610423875040fba35d53e'
         '0716a447478c478f0a00a34b85076173')

_gitroot="http://github.com/gnosek/fcgiwrap.git"
_gitname="fcgiwrap"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ]; then
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

  autoreconf -i
  ./configure --prefix /usr
  make
  make DESTDIR="$pkgdir/" install

  mkdir -p $pkgdir/etc/rc.d
  install -Dm755 $srcdir/initscript $pkgdir/etc/rc.d/fcgiwrap

  mkdir -p $pkgdir/etc/conf.d
  install -Dm644 $srcdir/conf $pkgdir/etc/conf.d/fcgiwrap
}
