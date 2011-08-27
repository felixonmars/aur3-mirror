# Maintainer: Hoàng Đức Hiếu <aur@zahe.me>
pkgname=kio-magnet-git
pkgver=20110109
pkgrel=1
pkgdesc="KIO slave for loading files over bittorrent"
arch=(i686 x86_64)
url="http://kde-apps.org/content/show.php?content=136909"
license=('GPL')
groups=('kioslave')
depends=('ktorrent-git')
makedepends=('git' 'cmake')
#optdepends=('ktorrent: *require* at least version 4.1beta1')
provides=('kio-magnet')
conflicts=('kio-magnet')
install=magnet.install

_gitroot="git://anongit.kde.org/scratch/weilbach/kio_magnet"
_gitname="kio_magnet"

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

  cmake -DCMAKE_INSTALL_PREFIX=$(kde4-config --prefix) "$srcdir/$_gitname"
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install

  # avoid conflicting ktorrent
  mv "$pkgdir"/usr/share/kde4/services/magnet{,_kio}.protocol
} 
