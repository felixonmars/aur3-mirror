# $Id: PKGBUILD,v 1.2 2005/05/02 02:21:42 judd Exp $
# Contributor: Evgenij Vdovin <evdovin@pochta.ru>
pkgname=lm1100
pkgver=1.0.2a
pkgrel=1
pkgdesc="Lexmark 1000/1100 printer driver (page compiler)"
url="http://openprinting.org/show_printer.cgi?recnum=Lexmark-1000"
depends=('glibc')
makedepends=('perl')
source=(http://www.openprinting.org/download/printing/$pkgname/$pkgname.$pkgver.tar.gz \
				http://www.openprinting.org/download/printing/$pkgname/${pkgname}maint.tar.gz \
				http://www.openprinting.org/download/printing/$pkgname/$pkgname.$pkgver-fix-compile-gcc-3.4.patch.gz \
				Lexmark-1000-lm1100.ppd gs-lm1100-0.1 \
				lm1100maint-0.1 a4_page.patch)
md5sums=('2b96b75459f194eabd4321c55c90c797' '49c8a6a7af2e4b6cef68593bccd48496' \
				'c0319924f7b0e9b335d48c1c099c67c6' \
				'90de334aef817d313ccfa9e1391da452' '0e63bc9ea72c80354bf7916aff41f4fe' \
				'cde562676f487bd7fd1b9241497e5f67' \
				'69c0cc7716262320b24637b450bcbf43')
build() {
  cd $startdir/src/$pkgname.$pkgver
	# for gcc 3.1 or later
	perl -p -i -e 's/friend Lexmark/friend class Lexmark/' *.h
	# for gcc 3.4 or later
	patch -N -i ../lm1100.1.0.2a-fix-compile-gcc-3.4.patch || return 1
	# for gcc 4.1 or later
	perl -p -i -e 's/\b[^\s:]+:://' *.h
	# A4 page support
	patch -Np1 -i ../a4_page.patch || return 1
  make || return 1
	mkdir -p $startdir/pkg/usr/{bin,share/lm1100}
	install -D -m755  lm1100 $startdir/pkg/usr/bin
	install -D -m755 byteutil.pl lexmark2ppm.pl ps-to-printer.fpi $startdir/pkg/usr/share/lm1100
	install -D -m644 README ../Lexmark-1000-lm1100.ppd ../gs-lm1100-0.1 $startdir/pkg/usr/share/lm1100
	cd $startdir/src/${pkgname}maint
	mkdir -p $startdir/pkg/usr/share/lm1100maint
	install -D -m755 ../lm1100maint-0.1 $startdir/pkg/usr/bin/lm1100maint
	install -D -m644 lexmarkback lexmarkchange $startdir/pkg/usr/share/lm1100maint
}
