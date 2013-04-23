# Maintainer: Zylex <zylex.stk@gmail.com>

pkgname=valabattery2-git
pkgver=20130420
pkgrel=1
pkgdesc="A simple battery tray monitor coded in vala. Fork of ValaBattery, includes options to notify of low battery and hibernate when too low."
arch=('i686' 'x86_64')
url="https://github.com/zylex/valabattery"
license=('GPL2')
depends=('acpi' 'gtk3' 'libnotify')
makedepends=('git' 'vala')
source=('valabattery.launcher')
md5sums=('786148f870afd28bf3f12d8b53edcfc3')
_gitroot="git://github.com/zylex/valabattery.git"
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
  install -d ${pkgdir}/{usr/bin/,/usr/share/,/usr/share/valabattery/,/etc/}
  install -D -m755 "$srcdir/valabattery.launcher" "$pkgdir/usr/bin/valabattery"
  cp -r "$srcdir/$_gitname-build/bin/Icons" "$pkgdir/usr/share/valabattery"
  cp "$srcdir/$_gitname-build/bin/Configuration/valabattery.conf" "$pkgdir/etc/valabattery.conf"
  install -D -m755 "$srcdir/$_gitname-build/bin/valabattery" "$pkgdir/usr/share/valabattery"
}
