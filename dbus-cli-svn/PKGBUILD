# Contributor: Baptiste Jonglez <baptiste--aur at jonglez dot org>

_pkgname=dbus-tools
pkgname=dbus-cli-svn
pkgver=r8
pkgrel=1
pkgdesc="tool to send messages to existing DBus services. Similar to dcop or dbus-send"
arch=('i686' 'x86_64')
url="http://code.google.com/p/dbus-tools/"
license=('MIT')
depends=('python2-dbus' 'python2-lxml')
makedepends=('subversion')
source=("$_pkgname::svn+http://dbus-tools.googlecode.com/svn/trunk/")
md5sums=('SKIP')


pkgver() {
  cd "$_pkgname"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

prepare() {
    cd "$_pkgname"
    sed  -i 's,#!/usr/bin/python,#!/usr/bin/python2,' dbus
}

package() {
  cd "$srcdir/$_pkgname"
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/zsh/site-functions

  install -m 0755 dbus $pkgdir/usr/bin
  install -m 0644 _dbus $pkgdir/usr/share/zsh/site-functions
}
