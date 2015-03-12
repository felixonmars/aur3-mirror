# Contributor: Nagy Gabor <ngaba@@bibl..u-szeged..hu>
pkgname=xcdroast
pkgver=0.98alpha16
pkgrel=5
pkgdesc="Lightweight cdrtools front-end for CD and DVD writing"
url="http://www.xcdroast.org/"
depends=('cdrkit>=1.1.9' 'gtk2')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz
	xcdroast-0.98alpha15-linebuffer.patch
	xcdroast-0.98alpha15-nowarn.patch
	xcdroast-0.98alpha15-scan.patch
	xcdroast-0.98alpha15-13_cdrecord_to_wodim.patch
	xcdroast-0.98alpha15-14_atapi_to_oldatapi.patch
	xcdroast-0.98alpha15-prodvd.patch
	cdrkit-dvd.patch
	readcd-readom.patch
        fix_cddb_hidden_tracks.patch
        io_progressbar_fix.patch)
md5sums=('bc3d335a30f292067eaaf1ea03ebaf17'
	'2ba3fbd7836e7fc3abb87c11a70c5a13'
	'3ded8a5703b06bda36d431fb87832a66'
	'82ad69e48b58392ff7f87fcde24a9ac3'
	'be7b85c121bf77c6d984be10303dcb73'
	'e22d234c729da85229854fce905e8014'
	'afed02d64247850002897216cfe1d2b2'
	'83658eb41c15c527ea6fb09cf01830e7'
	'23b3ee108fd74af20ec073978cd03e22'
        'e2a4193c011d40b7f54f16a51e3dd62f'
        '09864000d7c9717684f13d32dae40e96')
license=('GPL')
arch=('i686' 'x86_64')

build() {
  cd $srcdir/$pkgname-$pkgver
  patch -Np1 -i $srcdir/xcdroast-0.98alpha15-linebuffer.patch
  patch -Np1 -i $srcdir/xcdroast-0.98alpha15-nowarn.patch
  patch -Np1 -i $srcdir/xcdroast-0.98alpha15-scan.patch
  patch -Np1 -i $srcdir/xcdroast-0.98alpha15-13_cdrecord_to_wodim.patch
  patch -Np0 -i $srcdir/xcdroast-0.98alpha15-14_atapi_to_oldatapi.patch
  patch -Np1 -i $srcdir/xcdroast-0.98alpha15-prodvd.patch
  patch -Np0 -i $srcdir/cdrkit-dvd.patch
  patch -Np0 -i $srcdir/readcd-readom.patch
  patch -Np0 -i $srcdir/fix_cddb_hidden_tracks.patch
  patch -Np0 -i $srcdir/io_progressbar_fix.patch
  ./configure --prefix="/usr" --sysconfdir="/etc" --mandir="/usr/share/man" --enable-gtk2 --disable-nonrootmode
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
  rmdir $pkgdir/etc
  mkdir $pkgdir/usr/share/applications
  cp $srcdir/$pkgname-$pkgver/extra/xcdroast.desktop $pkgdir/usr/share/applications/xcdroast.desktop
  echo "Categories=AudioVideo;DiscBurning;" >> $pkgdir/usr/share/applications/xcdroast.desktop
}
