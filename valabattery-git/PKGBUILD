# Maintainer: Tom Englund <tomenglund26@gmail.com> , Tom^ @ irc.freenode.net

pkgname=valabattery-git
pkgver=20120304
pkgrel=1
pkgdesc="A simple battery tray monitor coded in vala"
arch=('i686' 'x86_64')
url="https://github.com/gulafaran/valabattery"
license=('GPL2')
depends=('acpi' 'gtk2')
makedepends=('git' 'vala')
source=('valabattery.launcher')
md5sums=('fd7f8617a992532f78b49b500602e161')
_gitroot="git://github.com/gulafaran/valabattery.git"
_gitname="valabattery"

build() 
{
  msg "Connecting to GIT server...."

  if [[ -d $_gitname ]] ; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting compile..."

  rm -rf "$srcdir/$_gitname-build"
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  sh compile.sh
}

package() 
{
  install -d ${pkgdir}/{usr/bin/,opt/,opt/valabattery/}
  install -D -m755 "$srcdir/valabattery.launcher" "$pkgdir/usr/bin/valabattery"
  cp -r "$srcdir/$_gitname-build/bin/Icons" "$pkgdir/opt/valabattery"
  install -D -m755 "$srcdir/$_gitname-build/bin/valabattery" "$pkgdir/opt/valabattery"
}
