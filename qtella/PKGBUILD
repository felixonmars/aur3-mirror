# $Id: PKGBUILD,v 1.7 2004/11/21 14:38:36 jgc Exp $
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=qtella
pkgver=0.6.5
pkgrel=1
pkgdesc="Qtella is a Gnutella client for Linux using QT"
depends=('kdelibs' 'id3lib')
source=(http://dl.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz \
	qtella.desktop)
url="http://qtella.sourceforge.net/"
md5sums=('210e5f014e348815d5b32cd26b605d9c'\
	 '4c979fb6481a0663078d16ce10a61124')

build() {
cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/opt/kde --with-qt-dir=/opt/qt --with-qt-includes=/opt/qt/include --with-qt-libs=/opt/qt/lib --with-kde-dir=/opt/kde --disable-sharp
  make || return 1
  make DESTDIR=$startdir/pkg install
  mkdir -p $startdir/pkg/opt/kde/share/applications
  install -m644 $startdir/src/qtella.desktop $startdir/pkg/opt/kde/share/applications/qtella.desktop
}
