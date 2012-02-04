# Contributor: Pavel Shevchuk <stlwrt@gmail.com>
pkgname=musicmood
pkgver=0.6.0
pkgrel=1
pkgdesc="Broadcast your Amarok song title into your mood for Skype for Linux"
arch=('i686' 'x86_64')
url="http://musicmood.broadbox.de/"
license=('GPL')
depends=('amarok-base' 'dbus-python' 'pygtk')
source=(http://$pkgname.broadbox.de/$pkgname.amarokscript.tar.bz2)
md5sums=('ed1ecd6b4bef9cc4d5067af82d414dc1')

build() {
  cd "$startdir/src/$pkgname"
  mkdir -p $startdir/pkg/opt/kde/share/apps/amarok/scripts/$pkgname
  install -m 755 musicmood.py $startdir/pkg/opt/kde/share/apps/amarok/scripts/$pkgname
  install -m 644 musicmood.spec $startdir/pkg/opt/kde/share/apps/amarok/scripts/$pkgname
  install -m 644 README $startdir/pkg/opt/kde/share/apps/amarok/scripts/$pkgname
  install -m 644 COPYING $startdir/pkg/opt/kde/share/apps/amarok/scripts/$pkgname
}

# vim:set ts=2 sw=2 et:
