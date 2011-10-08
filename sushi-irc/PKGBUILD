# Maintainer: Marco Russo <nofoo@gmx.net>
pkgname=sushi-irc
pkgver=1.3.0
pkgrel=1
pkgdesc="IRC client/server suite that abstracts the IRC protocol using DBUS signals"
arch=('i686' 'x86_64')
url="http://sushi.ikkoku.de"
license=('BSD')
depends=('dbus-core' 'dbus-glib' 'glib2>=2.16' 'pyxdg' 'intltool')
optdepends=('networkmanager' 'libnice' 'python-urwid' 'gnutls')
source=('http://redmine.ikkoku.de/attachments/download/31/sushi-1.3.0.tar.bz2' 'sushi.patch')
md5sums=('7bad32eb8b6c2ee84489fcdfdaeab4b0' 'd937679d607c391355e9ae708d9f8657')

build() {

  cd "${srcdir}/sushi-$pkgver"
  patch -p1 -i $srcdir/sushi.patch 
  python2 waf configure --prefix="/usr" 
  python2 waf build
  python2 waf install --destdir=$pkgdir 
}
