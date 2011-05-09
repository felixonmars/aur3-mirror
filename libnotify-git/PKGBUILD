# Maintainer: Soulou <leo@soulou.fr>
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>

pkgname=libnotify-git
pkgver=20110509
pkgrel=1
pkgdesc="Gnome notification library"
arch=('i686' 'x86_64')
license=('GPL2.1')
url="http://library.gnome.org/devel/libnotify/"
depends=('glib2-git')
makedepends=('pkgconfig' 'git')
options=('!libtool')
conflicts=('libnotify')
provides=('libnotify=0.7.3')
source=()
md5sums=()

_gitroot="git://git.gnome.org/libnotify.git"
_gitname="libnotify"


build() {
  cd ${srcdir}
  msg "Connecting to git.gnome.org GIT server...."

  if [ -d ${srcdir}/$_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
    else
    git clone $_gitroot
  fi

  cd ${srcdir}/$_gitname
  ./autogen.sh --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install || return 1
}
