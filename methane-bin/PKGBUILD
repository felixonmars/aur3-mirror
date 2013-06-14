# Maintainer: OS Hazard <oshazard+aur@gmail.com>
# Contributor: Larryhaja  <larryhaja at gmail.com>
# Contributor: Dany Martineau <dany.luc.martineau at gmail.com>

pkgname=methane-bin
pkgver=1.5.1
pkgrel=2
pkgdesc="Super Methane Bros ported from Atari"
arch=('i686' 'x86_64')
url="http://methane.sourceforge.net"
license=('GPL')
provides=('methane')
depends=('clanlib' 'clanlib-gl1' 'libjpeg6')
makedepends=('rpmextract')
install=methane.install
_rpmrel=7
_fc=fc19
_arch=$(uname -m)
source=(ftp://ftp.is.co.za/mirror/fedora.redhat.com/linux/development/rawhide/x86_64/os/Packages/m/methane-$pkgver-$_rpmrel.$_fc.x86_64.rpm)
md5sums=('42f58b5829cff80a8b4a7f9d7a345fc7')

if [ ${_arch} = "x86_64" ]; then
  source=(ftp://ftp.is.co.za/mirror/fedora.redhat.com/linux/development/rawhide/x86_64/os/Packages/m/methane-$pkgver-$_rpmrel.$_fc.x86_64.rpm)
  md5sums=('42f58b5829cff80a8b4a7f9d7a345fc7')
elif [ ${_arch} = "i686" ]; then
  source=(ftp://ftp.is.co.za/mirror/fedora.redhat.com/linux/development/rawhide/i386/os/Packages/m/methane-$pkgver-$_rpmrel.$_fc.i686.rpm)
  md5sums=('81cb5056eff164baf98375aabdddf574')
else
  unset source
fi  

build() {
  cd $srcdir
  sed -i 's/Exec=methane-wrapper/Exec=methane -w/g' usr/share/applications/methane.desktop
}

package() {
  cd $srcdir
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share
  mkdir -p $pkgdir/usr/share/applications
  mkdir -p $pkgdir/usr/share/doc
  mkdir -p $pkgdir/usr/share/icons/hicolor/128x128/apps
  mkdir -p $pkgdir/var/games
  chmod -R 775 $pkgdir/var/games
  cp usr/bin/methane $pkgdir/usr/bin/
  cp -r usr/share/methane $pkgdir/usr/share/
  cp usr/share/applications/methane.desktop $pkgdir/usr/share/applications/
  cp -r usr/share/doc/methane-$pkgver $pkgdir/usr/share/doc/
  cp usr/share/icons/hicolor/128x128/apps/methane.png $pkgdir/usr/share/icons/hicolor/128x128/apps/
  cp var/games/methane.scores $pkgdir/var/games/
}
