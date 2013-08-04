# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jason R Begley (jayray@digitalgoat.com>
# Contributor: Dan Fuhry <dan@fuhry.us>

pkgname=freeradius-wpe
_pkgbase=freeradius
pkgver=2.1.12
pkgrel=2
pkgdesc="The premier open source RADIUS server - Wireless Pwnage Edition (WPE), demonstrating RADIUS impersonation vulnerabilities"
arch=('i686' 'x86_64')
url="http://www.freeradius.org/"
license=('GPL')
provides=('freeradius')
conflicts=('freeradius')
depends=('krb5' 'pth' 'net-snmp' 'postgresql-libs' 'libmariadbclient')
makedepends=('libpcap' 'unixodbc' 'python2')
optdepends=('libpcap' 'unixodbc' 'python2')
options=('!libtool' '!makeflags')
install=${_pkgbase}.install
install=${_pkgbase}.install
source=(http://ftp.cc.uoc.gr/mirrors/ftp.freeradius.org/old/freeradius-server-${pkgver}.tar.gz
	https://github.com/brad-anton/freeradius-wpe/raw/master/freeradius-wpe.patch
	freeradius.tmpfiles
	freeradius.service
	krb5-build-fix.patch)
sha512sums=('543ca20faa5ab2c45d7e0c9627c2860ac6eb2d1e3e920beffad612bb4a50a3ae65fe8f20a385541bca75ba05575091168de22c9c245f6869ecd5c862e6686189'
	    '5c5a6839eed1004d436c9d42a7a3a595e86e4832bbe952e8001d6dd5686b2ed311484f845841c18e7dd258c611b5ada1a11816516ad1fa8ab51d1231d12586e3'
	    'c42109f335dfbdc14c9a60b3cc103e2b6e730e9188b656197843d0a999aefd653cc5ed2951b77b703d22ef37e39e645d64a3f9c295ef356ba2f6031f75d38f39'
	    'd6bd4bb4d9628e5ac68421341e968e70f535cf7a26169c4ad48bbc7d4b04a91ba2307db34855116e582ec0236061373b9c1f86e6461d767ffcc61385c6a025e8'
	    '55edef395b71721f47a34d7712056bf419b834fe81c94a386638197133f232427025dfe3c88d884d65051335281849a725bad1f526bd606ee4c2f9cbd3cfbdb5')

build() {
  cd $srcdir/freeradius-server-$pkgver
  export CFLAGS="$CFLAGS -fno-strict-aliasing"
  sed -i 's/ -DKRB5_DEPRECATED//' src/modules/rlm_krb5/Makefile.in
  patch -p1 <$srcdir/freeradius-wpe.patch
  patch -p1 <$srcdir/krb5-build-fix.patch
  ./configure --with-system-libtool --with-system-libltdl \
	      --prefix=/usr --enable-heimdal-krb5 \
	      --localstatedir=/var \
	      --sysconfdir=/etc \
	      --sbindir=/usr/bin \
	      --libdir=/usr/lib/freeradius \
	      --with-udpfromto
  make
}

package() {
  cd $srcdir/freeradius-server-$pkgver
  make install R=$pkgdir
  chmod o+r $pkgdir/etc/raddb/*
  mv $pkgdir/etc/raddb $pkgdir/etc/raddb.default
  rm -rf $pkgdir/var/run

  install -Dm0644 $srcdir/$_pkgbase.service $pkgdir/usr/lib/systemd/system/$_pkgbase.service
  install -Dm0644 $srcdir/$_pkgbase.tmpfiles $pkgdir/usr/lib/tmpfiles.d/$_pkgbase.conf
}
