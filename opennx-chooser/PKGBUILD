# Contributor: Armin Luntzer
# Original opennx PKGBUILD: Tomas Groth tomasgroth.at.yahoo.dk

pkgname=opennx-chooser
pkgver=0.16
pkgrel=1
pkgdesc="A GPL replacement for the NoMachine client, patched to always show the session chooser"
url="http://opennx.sf.net/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('wxgtk' 'opensc' 'cups' 'libcups' 'libxext' 'libxft' 'nx-common' 'xorg-xauth')
conflicts=('nxclient' 'opennx')
source=(http://downloads.sourceforge.net/project/opennx/opennx/$pkgver/opennx-$pkgver.tar.gz always_show_session_chooser.patch)
md5sums=('0a6ad54fbbbb645e2a332b6e92885c5b'
	 '5557bb64f1dd513ea0a4cfa797085ccf')

build() {
  cd $srcdir/opennx-$pkgver
  patch -i $srcdir/always_show_session_chooser.patch
  ./configure --prefix=/opt/NX
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
}
