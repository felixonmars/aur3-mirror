# Contributor: David Spicer <azleifel at googlemail dot com>

pkgname=fedora-xdg-menu-git
_gitname="openbox"
pkgver=20130414_g441ff2e
pkgrel=1
pkgdesc="Creates an Openbox pipe menu from the current user's Gnome menu"
arch=('any')
url="http://pkgs.fedoraproject.org/gitweb/?p=openbox.git;a=summary"
license=('GPL')
depends=('python2-xdg')
makedepends=('git')
source=("git://pkgs.fedoraproject.org/openbox.git")
md5sums=('SKIP')

pkgver() {
  cd $_gitname

  echo -n 20130414_
  git describe --always|grep -o -- "[^-]*$"
}

package() {
  cd $_gitname

  install -Dm755 "xdg-menu" "$pkgdir/usr/bin/xdg-menu"
  sed -i -e '1c#!/usr/bin/env python2' "$pkgdir/usr/bin/xdg-menu"

  install -Dm644 "menu.xml" "$pkgdir/usr/share/doc/$pkgname/menu.xml.example"
  sed -i 's|_LIBEXECDIR_|/usr/bin|g' "$pkgdir/usr/share/doc/$pkgname/menu.xml.example"
}
