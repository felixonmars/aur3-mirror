# Contributor: Franz Burgmann <f dot burgmann at gmail dot com>
# Maintainer: Markus Klingenberger <markus dot klingenberger at gmx dot de>

pkgname=xmltv2vdr
pkgver=1.0.9
pkgrel=1
pkgdesc="transfers EPG data from xml to VDR."
arch=('i686' 'x86_64')
url="http://www.vdr-wiki.de/wiki/index.php/Xmltv2vdr"
license=('GPL2')
depends=('vdr' 'xmltv' 'perl-date-manip')
source=(ftp://ftp.tvdr.de/vdr/Tools/$pkgname-$pkgver.tar.gz
	channels.conf)
md5sums=(7f1705b433bbc0bbefe652a1404dc029
	7ec017d3932db0dba597216c40298d75)

build() {
  cd "$srcdir/$pkgname-$pkgver" || return 1
  
  mkdir -p $pkgdir/usr/bin || return 1
  cp xmltv2vdr.pl $pkgdir/usr/bin/ || return 1
  cp grab_freeview_epg.sh $pkgdir/usr/bin/ || return 1
  
  mkdir -p $pkgdir/etc/xmltv2vdr || return 1
  cp -r ../../channels.conf $pkgdir/etc/xmltv2vdr || return 1

  mkdir -p $pkgdir/usr/share/doc/$pkgname || return 1
  cp -r examples $pkgdir/usr/share/doc/$pkgname || return 1
  cp -r COPYING $pkgdir/usr/share/doc/$pkgname || return 1
  cp -r HISTORY $pkgdir/usr/share/doc/$pkgname || return 1
  cp -r README $pkgdir/usr/share/doc/$pkgname || return 1
}
