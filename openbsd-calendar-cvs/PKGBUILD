# Mantained by: Jens Staal <staal1978@gmail.com>

pkgname=openbsd-calendar-cvs
pkgver=20120603
pkgrel=1
pkgdesc="reminder service from OpenBSD"
arch=('i686' 'x86_64')
url="http://www.openbsd.org/cgi-bin/man.cgi?query=calendar"
license=('custom:BSD')
provides=('calendar')
depends=('libobase-git')
makedepends=('cvs' 'openssh' 'bmake')
sources=('makefile.patch' 'calendarh.patch' 'calendarc.patch')
md5sums=('75a1f113099526c05c1dbcfa40c20a46' '8ec88852168a372d4f93fe035a9ac18c' \
'365fc2f92c07b026df54f94a0251f025')

__cvsroot="anoncvs@anoncvs1.ca.openbsd.org:/cvs"
__cvsmod="calendar"

build() {
	cd $srcdir

	CVS_RSH=ssh cvs -d $__cvsroot get -P src/usr.bin/$__cvsmod
	CVS_RSH=ssh cvs -d $__cvsroot get -P src/include/login_cap.h

	rm -rf build
	cp -ar $srcdir/src/usr.bin/$__cvsmod build
	cp $srcdir/src/include/*.h $srcdir/build/
# setting up a build environment utilizing libobase
	CFLAGS="$CFLAGS -I. -I/usr/include/libobase"
	LIBS="/usr/lib/libobase.a $LIBS"
	cd $srcdir/build
	patch -p0 Makefile $startdir/makefile.patch
	patch -p0 calendar.h $startdir/calendarh.patch
	patch -p0 calendar.c $startdir/calendarc.patch # not happy about this one. Any way to get login_cap to work?
	bmake  
}

package() {
	mkdir -p $pkgdir/usr/{bin,share/calendar}
	INTER=('de_DE.ISO_8859-1' 'hr_HR.ISO_8859-2' 'ru_RU.KOI8-R' 'fr_FR.ISO8859-1')
	for lang in $INTER; do
	mkdir -p $pkgdir/usr/share/calendar/$lang
	done
	cd $srcdir/build
	export DESTDIR=$pkgdir
	bmake install 
	msg2 "fixing location of binary"
	mv $pkgdir/calendar $pkgdir/usr/bin/
}
