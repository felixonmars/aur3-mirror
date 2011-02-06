# Maintainer: Andries Radu <admiral0@live.it>

pkgname=polinux-wifi-nm
pkgver=64
pkgrel=1
license=('GPL')
pkgdesc="A script to automate connection to the Polictecnico di Milano Internet network."
url="http://code.google.com/p/polinux/source/browse/trunk/polinux-desktop-2.0/script/"
arch=('i686' 'x86_64')
depends=('zenity' 'gksu' 'openssl' 'network-manager-applet')
conflicts=('polinux-wifi polinux-wifi-wicd')
provides=('polinux-wifi')
makedepends=('subversion')
md5sums=()

_svntrunk=http://polinux.googlecode.com/svn/trunk/polinux-desktop-2.0/
_svnmod=script

build() {
  cd $startdir/src

  svn co $_svntrunk$_svnmod
  cd $_svnmod
  mkdir -p $startdir/pkg/usr/bin
  mkdir -p $startdir/pkg/usr/share/applications
  mkdir -p $startdir/pkg/usr/share/icons
  install  wifiwizard-nm-sudo.sh $startdir/pkg/usr/bin/
  install  wifiwizard-nm.sh $startdir/pkg/usr/bin/
  cp wifiwizard-nm.desktop $startdir/pkg/usr/share/applications/
  cp wifiwizard.png $startdir/pkg/usr/share/icons/
}
