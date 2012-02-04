# Maintainer: Eric Le Bras <eric.lebras@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve>
# Contributor: Douglas Soares de Andrade <dsandrade@gmail.com>
pkgname=tora-instantclient
pkgver=2.1.2
pkgrel=1
pkgdesc="Toolkit for Oracle, also includes support for MySQL and PostgreSQL"
arch=('i686' 'x86_64')
url="http://tora.sourceforge.net"
license=('GPL')
depends=('qscintilla' 'instantclient-basic>=11.2.0.1')
makedepends=('instantclient-sdk>=11.2.0.1')
options=('!libtool' '!emptydirs')
source=(http://downloads.sourceforge.net/tora/tora-$pkgver.tar.gz
	tora.desktop
	tora-instantclient.patch)
install=tora.install
md5sums=('2b49bbe9f4dc83ce33a22e888575ea73'
         '3d9cde525ebb385c5f639081dfec3431'
         '148284d0913d3ef8b83e0f190d8d00e9')
build() {
  cd $srcdir/tora-$pkgver
  patch -p1 -i ../tora-instantclient.patch
  ./configure --prefix=/usr --with-x \
	--with-oracle-includes=/opt/instantclient/sdk/include \
	--with-oracle-libraries=/opt/instantclient \
	--with-oci-version=11G \
	--with-qt-dir=/usr/share/qt \
	--libdir=/usr/lib || return 1
  make || return 1
  make DESTDIR="$pkgdir" install || return 1
  rm $pkgdir/usr/share/info/dir || return 1
  gzip $pkgdir/usr/share/info/* || return 1
  mkdir -p $pkgdir/usr/share/applications
  cp -p $srcdir/tora.desktop $pkgdir/usr/share/applications
  mkdir -p $pkgdir/usr/share/icons/hicolor/32x32/apps
  cp -p src/icons/tora.xpm $pkgdir/usr/share/icons/hicolor/32x32/apps
}
