# Maintainer: Yuri Bochkarev <baltazar.bz@gmail.com>
pkgname=notify-osd-better-git
_realname=notify-osd
pkgver=20111205
pkgrel=1
pkgdesc="A fork of notify-osd that disables image resizing and adds multiple popups at a time."
arch=('i686' 'x86_64')
url="https://github.com/magcius/notify-osd-better"
license=('GPL')
depends=('gconf' 'cairo' 'libwnck')
makedepends=('git' 'gnome-common' 'libnotify')
conflicts=('notification-daemon' 'notify-osd')
provides=('notification-daemon' 'notify-osd')

_gitroot="https://github.com/magcius/notify-osd-better"
_gitname="notify-osd-better"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # remove tests and examples
  #
  sed -i 's/SUBDIRS = src tests data examples/SUBDIRS = src data/' Makefile.in

  #
  # BUILD HERE
  #
  sed -i 's,/usr/lib/notify-osd/,@LIBEXECDIR@/,' data/org.freedesktop.Notifications.service.in
  ./autogen.sh --prefix=/usr --libexecdir=/usr/lib/notify-osd
  ./configure --prefix=/usr --libexecdir=/usr/lib/notify-osd
  make

  #
  # had to hard-code it -- autogen.sh and configure dont seem to understand --libexecdir option
  #
  sed -i 's,/usr/local/libexec/notify-osd,/usr/lib/notify-osd/notify-osd,' data/org.freedesktop.Notifications.service
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
