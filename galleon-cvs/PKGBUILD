# Maintainer Matthew Bauer <mjbauer95@gmail.com>

pkgname=galleon-cvs
pkgver=20100110
pkgrel=1
pkgdesc="Galleon is a Java application which means it requires the Java Runtime Environment (JRE) to be installed for it to run on your computer. Once Galleon is running on your computer, you can access its applications on your TiVo DVR."
url="http://galleon.tv/"
arch=(any)
license=('custom')
depends=('java-runtime')
provides=('galleon')
conflicts=('galleon')
makedepends=('cvs')

_cvsroot=":pserver:anonymous:@galleon.cvs.sourceforge.net:/cvsroot/galleon"
_cvsmod="galleon"

build() {
	cd ${srcdir}

	msg "Connecting to $_cvsmod.sourceforge.net CVS server...."
	if [ -d $_cvsmod/CVS ]; then
		cd $_cvsmod
		cvs -z3 update -d
	else
		cvs -z3 -d $_cvsroot co -D $pkgver -f $_cvsmod
		cd $_cvsmod
	fi

	msg "CVS checkout done or server timeout"
	msg "Starting make..."

	APPDIR=/usr/share/galleon
	CACHEDIR=/var/cache/galleon
	CONFDIR=/etc/galleon
	LIBDIR=/usr/lib/galleon
	LOGDIR=/var/log/galleon
	VARDIR=/var/lib/galleon

	install -d $pkgdir/${APPDIR}
	install -d $pkgdir/${CACHEDIR}
	install -d $pkgdir/${CONFDIR}
	install -d $pkgdir/${LIBDIR}
	install -d $pkgdir/${LOGDIR}
	install -d $pkgdir/${VARDIR}/hme
	install -d $pkgdir/${VARDIR}/data
	install -d $pkgdir/etc/rc.d
	mkdir -p $pkgdir/usr/bin
	ln -s /usr/share/galleon/bin/galleon $pkgdir/etc/rc.d/galleon
	ln -s /usr/share/galleon/bin/galleon $pkgdir/usr/bin
	cp -rf media $pkgdir/${APPDIR}
	cp -rf bin/unix $pkgdir/${APPDIR}/bin
	cp -f bin/unix/Makefile *.txt $pkgdir/${APPDIR}
	cp -f conf/*.* $pkgdir/${CONFDIR}
	cp -rf lib/* $pkgdir/${LIBDIR}
	cp -rf apps skins $pkgdir/${VARDIR}
	cp -rf conf/templates $pkgdir/${VARDIR}
	cp -rf bin/unix/wrapper-linux* $pkgdir/usr/share/galleon/bin/wrapper
	chmod a+rwx $pkgdir/usr/share/galleon/bin/wrapper
	chmod a+rwx $pkgdir/${APPDIR}/bin/gui.sh
	chmod a+rwx $pkgdir/${APPDIR}/bin/run.sh
	chmod a+rwx $pkgdir/${APPDIR}/bin/galleon
#	chmod +rw $pkgdir/${CONFDIR}/configure.xml
	ln -sf ${VARDIR}/apps $pkgdir/${APPDIR}/apps
	ln -sf ${CONFDIR} $pkgdir/${APPDIR}/conf
	ln -sf ${VARDIR}/data $pkgdir/${APPDIR}/data
	ln -sf ${VARDIR}/hme $pkgdir/${APPDIR}/hme 
	ln -sf ${LIBDIR} $pkgdir/${APPDIR}/lib
	ln -sf ${LOGDIR} $pkgdir/${APPDIR}/logs 
	ln -sf ${VARDIR}/skins $pkgdir/${APPDIR}/skins
	ln -sf ${VARDIR}/templates $pkgdir/${CONFDIR}/templates
}
