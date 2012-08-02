# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=foff
pkgver=0.99.5
pkgrel=5
pkgdesc="A lightweight graphical (GTK+) FTP client written in Python."
arch=('i686' 'x86_64')
url="http://foff.sourceforge.net/"
license=('GPL')
depends=('python2' 'pygtk')
install=foff.install
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz \
        foff.desktop)
md5sums=('9bb64d2ffc96363924c791706d291a76' \
         'c37d128b22eb7ecb28b317acea2c872c')

build() {
	cd ${srcdir}/${pkgname}
	# the included setup.py won't work for linux so we'll have to improvise
	PYTHONLIBSDIR=$(python2 -c "import distutils.sysconfig; print distutils.sysconfig.get_python_lib()")
	PACKAGESDIR=$PYTHONLIBSDIR/${pkgname}
	install -D -m755 foff.py ${pkgdir}/$PACKAGESDIR/foff.py
	install -D -m644 libglade.py $startdir/pkg/$PACKAGESDIR/libglade.py
	install -m644 foff.glade ${pkgdir}/$PACKAGESDIR/foff.glade
	install -m644 pyDes.py ${pkgdir}/$PACKAGESDIR/pyDes.py
	install -m644 foff_logo00.png ${pkgdir}/$PACKAGESDIR/foff_logo00.png
	install -m644 Copying.txt ${pkgdir}/$PACKAGESDIR/Copying.txt
	install -m644 foff-player.glade ${pkgdir}/$PACKAGESDIR/foff-player.glade
	install -m644 foffplay.py ${pkgdir}/$PACKAGESDIR/foffplay.py
	install -m644 foffutil.py ${pkgdir}/$PACKAGESDIR/foffutil.py
	install -m644 foffwnds.py ${pkgdir}/$PACKAGESDIR/foffwnds.py
	# this is the main script but it has to be installed in the same dir as the modules in order to run
	install -m755 foff.py ${pkgdir}/$PACKAGESDIR/foff.py
	# byte-compile all modules
	python2 -c "import compileall; compileall.compile_dir('${pkgdir}/$PACKAGESDIR/')"
	[ -f ${pkgdir}/$PACKAGESDIR/foff.pyc ] && rm ${pkgdir}/$PACKAGESDIR/foff.pyc
	mkdir -p ${pkgdir}/usr/bin/
	echo -e "#!/bin/bash\n\ncd $PACKAGESDIR && python2 foff.py" >${pkgdir}/usr/bin/${pkgname}
	chmod 755 ${pkgdir}/usr/bin/${pkgname}
	install -D -m644 ${srcdir}/foff.desktop ${pkgdir}/usr/share/applications/foff.desktop
}
