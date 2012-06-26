# Maintainer:  Bartlomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: Marcin Karpezo <sirmacik at gmail dot com>
# Contributor: Tadeusz Sośnierz <spamthisdomain at gmail dot com>

pkgname=pacnet-git
pkgver=20120626
pkgrel=1
pkgdesc="Pacnet database client"
arch=(any)
url="http://github.com/tadzik/pacnet"
license=('MIT')
depends=('perl-json-xs' 'perl-libwww')
makedepends=('git')

_gitroot="git://github.com/tadzik/pacnet.git"
_gitname="pacnet"

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
}

package() {
    cd "$srcdir/$_gitname-build"
	install -D -m 755 pacnet $pkgdir/usr/bin/pacnet
}
