# Maintainer: Carl Ellis <carl.ellis@comp.lancs.ac.uk>
pkgname=rbatmon-git
pkgver=20120910
pkgrel=1
pkgdesc="A lightweight battery monitor written in Ruby/Gtk2. Will sit in the system tray, poll ACPI and update the tooltip."
arch=(any)
url="http://carlellis.co.uk/content/projects/rbatmon/"
license=('GPL3')
depends=('acpi' 'ruby' 'ruby-gnome2' 'gtk2' 'ruby-pango')
makedepends=('git')
optdepends=()
provides=(rbatmon)
conflicts=(rbatmon)
replaces=(rbatmon)
backup=()
options=()
install=
source=()
md5sums=() #generate with 'makepkg -g'

_gitroot="git://github.com/carl-ellis/BatteryMonitor.git"
_gitname="BatteryMonitor"

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

   mkdir $pkgdir/usr
   mkdir $pkgdir/usr/bin
   cp batterymon.rb $pkgdir/usr/bin/rbatmon
   cd $pkgdir/usr/bin/
   chmod +x rbatmon
}


# vim:set ts=2 sw=2 et:
