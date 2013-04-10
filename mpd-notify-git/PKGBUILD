# Maintainer: Unia <jthidskes@outlook.com> 

pkgname=mpd-notify-git
_gitname=mpd-notify
pkgver=2013.04.10
pkgrel=1
pkgdesc="Notifies you about MPD song changes"
arch=('i686' 'x86_64')
url="https://github.com/Unia/mpd-notify"
license=('GPL')
depends=('libnotify' 'libmpdclient')
makedepends=('git')
source=('git://github.com/Unia/mpd-notify.git')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  git log -1 --format="%cd" --date=short | sed 's|-|.|g'
}

build() {
  cd $_gitname
  make
}

package() {
  cd $_gitname
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
