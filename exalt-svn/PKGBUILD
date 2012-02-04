# Contributor: Slappinjohn <slappinjohn@gmx.net>
# Contributor: Michele Gastaldo <pikiweb@gmail.com>

pkgname=exalt-svn
pkgver=51666
pkgrel=2
pkgdesc="Networkmanager for e17 written by Watchwolf"
arch=('i686' 'x86_64')
url="http://watchwolf.fr/wiki/doku.php?id=exalt"
license=('LGPL2.1')
depends=('e_dbus-svn' 'wpa_supplicant' 'dhclient')
makedepends=('subversion' 'pkgconfig')
provides=('exalt')
options=('!libtool')
install=${pkgname}.install

source=(exaltd)
md5sums=(99690f45875bc0458d3491b9a0c5d757)

_svntrunk="http://svn.enlightenment.org/svn/e/trunk/exalt"
_svnmod="exalt"

build() {
   cd $srcdir

msg "Connecting to $_svntrunk SVN server...."
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build
  
  ./autogen.sh --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir install || return 1

  install -Dm744 ${startdir}/src/${_svnmod}-build/exalt.pc ${pkgdir}/usr/share/lib/pkgconfig/exalt.pc || return 1
  install -Dm744 ${startdir}/src/${_svnmod}-build/exalt_dbus.pc ${pkgdir}/usr/share/lib/pkgconfig/exalt_dbus.pc || return 1

  install -Dm744 ${startdir}/src/${_svnmod}/data/daemon/dbus/exalt.conf ${pkgdir}/etc/dbus-1/system.d/exalt.conf || return 1
  install -Dm744 ${startdir}/exaltd  ${pkgdir}/etc/rc.d/exaltd || return 1

  rm -r $startdir/src/$_svnmod-build
}
# vim:syntax=sh
