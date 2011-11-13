# Maintainer: Max Roder <maxroder@web.de>

pkgname=openkore-svn
pkgver=7864
pkgrel=1
pkgdesc="A custom Ragnarok online client. Uses its own updater."
arch=('i686' 'x86_64')
url="http://openkore.com"
license=('GPL')
depends=('perl-time-hires' 'perl-io-compress')
makedepends=('subversion' 'python2')
optdepends=('perl-wx: To use the mapviewer')
provides=('openkore')
install='openkore-svn.install'
options=('emptydirs')

_svntrunk="https://openkore.svn.sourceforge.net/svnroot/openkore/openkore/trunk/"
_svnmod="openkore"

_svnfields="https://openkore.svn.sourceforge.net/svnroot/openkore/fieldpack/trunk/fields/"
_svntables="https://openkore.svn.sourceforge.net/svnroot/openkore/tablepack/trunk/tables/"
_svncontrol="https://openkore.svn.sourceforge.net/svnroot/openkore/confpack/trunk/control/"

build() {
	cd ${srcdir}

	msg "Getting main program..."

	if [ -d ${_svnmod}/.svn ]; then
		(cd ${_svnmod} && svn up -r $pkgver)
	else
		svn co ${_svntrunk} --config-dir ./ -r $pkgver ${_svnmod}
	fi

	mkdir -p ${srcdir}/fields ${srcdir}/tables ${srcdir}/control

	msg "Getting fields..."
	cd ${srcdir}/fields/
	if [ -d .svn ]; then
		(svn up)
	else
		svn co ${_svnfields} --config-dir ./ .
	fi

	msg "Getting tables..."
	cd ${srcdir}/tables/
	if [ -d .svn ]; then
		(svn up)
	else
		svn co ${_svntables} --config-dir ./ .
	fi

	msg "Getting config files..."
	cd ${srcdir}/control/
	if [ -d .svn ]; then
		(svn up)
	else
		svn co ${_svncontrol} --config-dir ./ .
	fi

	msg "SVN checkout done or server timeout"

	cd ${srcdir}

	msg "Starting build..."

	svn export ${_svnmod} ${_svnmod}-build
	cd ${_svnmod}-build

	# Patch Makefile (python2 instead of python)
	sed -i 's/python/python2/g' Makefile

	# Build
	make
}

package() {
	cd ${srcdir}/${_svnmod}-build

	# Put everything together
	cp -a ${srcdir}/fields ${srcdir}/${_svnmod}-build/
	cp -a ${srcdir}/tables ${srcdir}/${_svnmod}-build/
	cp -a ${srcdir}/control ${srcdir}/${_svnmod}-build/

	# Remove all .exe files
	rm -rf $(find "." -name "*.exe")

	install -d ${pkgdir}/opt/openkore/ ${pkgdir}/usr/bin/

	# Include .svn directories as autoupdate.pl uses them to determine revision.
	cp -a ${srcdir}/${_svnmod}/.svn ${pkgdir}/opt/openkore/
	cp -a ${srcdir}/fields/.svn ${pkgdir}/opt/openkore/
	cp -a ${srcdir}/tables/.svn ${pkgdir}/opt/openkore/
	cp -a ${srcdir}/control/.svn ${pkgdir}/opt/openkore/
	
	cp -a * ${pkgdir}/opt/openkore/

	# Set correct permissions
	chmod -R g+rws ${pkgdir}/opt/openkore
	
	# Install wrapper script
	echo "#!/bin/sh" >> ${pkgdir}/usr/bin/openkore
	echo "umask u=rwx,g=rwx,o=rx" >> ${pkgdir}/usr/bin/openkore
	echo "cd /opt/openkore/; perl openkore.pl" >> ${pkgdir}/usr/bin/openkore
	chmod +x ${pkgdir}/usr/bin/openkore
	
	# Install autoupdate wrapper script
	echo "#!/bin/sh" >> ${pkgdir}/usr/bin/openkore-update
	echo "umask u=rwx,g=rwx,o=rx" >> ${pkgdir}/usr/bin/openkore-update
	echo "cd /opt/openkore/; perl autoupdate.pl" >> ${pkgdir}/usr/bin/openkore-update
	chmod +x ${pkgdir}/usr/bin/openkore-update

	# Clean up
	cd .. && rm -rf ${srcdir}/${_svnmod}-build
}
