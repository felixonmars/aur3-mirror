# Maintainer: Johan Reitan <johan.reitan at gmail dot com>
# Contributor: dlandau
# Contributor: kote <koteccr at gmail dot com>

pkgname=spokify-git
pkgver=354.f6b61f6
pkgrel=1
pkgdesc="Spotify client for KDE (only for premium accounts)"
arch=('i686' 'x86_64')
url="https://github.com/sandsmark/Spokify"
_screenshot="http://i.imgur.com/hiQWt.png"
license=('GPL')
depends=('libspotify' 'liblastfm' 'kdebase-runtime')
makedepends=('automoc4' 'git' 'cmake')
source=("git://github.com/sandsmark/Spokify.git")
md5sums=('SKIP')

_gitname=Spokify

pkgver() {
  cd $_gitname
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd $srcdir/$_gitname

#  sed -i 's#spotify/api.h#/usr/include/libspotify/api.h#g' mainwidget.h
#  sed -i 's#spotify/api.h#/usr/include/libspotify/api.h#g' mainwindow.h
#  sed -i 's#spotify/api.h#/usr/include/libspotify/api.h#g' playlistmodel.cpp

#  cmake . -DCMAKE_INSTALL_PREFIX=$( kde4-config --prefix ) -DLIBSPOTIFY_INCLUDE_DIR=/usr/lib/ || return 1
  cmake . -DCMAKE_INSTALL_PREFIX=$( kde4-config --prefix ) || return 1
  make || return 1
}

package() {
  cd $srcdir/$_gitname
  make DESTDIR="$pkgdir" install
}
