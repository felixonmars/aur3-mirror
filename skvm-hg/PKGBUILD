# Maintainer: stateless <stateless@archlinux.us>

pkgname=skvm-hg
pkgver=0.1
pkgrel=1
pkgdesc="A lightweight volume manager"
arch=('i686' 'x86_64')
url="http://code.suckless.org/hg/skvm"
license=('MIT')
depends=('hal' 'dbus')
makedepends=('mercurial')
conflicts=('skvm')
provides=('skvm')

_hgroot="http://hg.suckless.org/skvm"
_hgname="skvm"

build() {
	cd ${srcdir}
	
	msg "Connecting to mercurial server..."
	
	if [ -d $_hgname ]; then
		cd $_hgname && hg pull
		cd ..
		msg "The local files are updated."
	else
		hg clone $_hgroot
	fi
	
	msg "Mercurial checkout done or server timeout."
	msg "Starting make..."
	
	rm -rf $_hgname-build
	cp -r $_hgname $_hgname-build
	cd $_hgname-build
	
	make || return 1
	
	mkdir -p ${startdir}/pkg/usr/bin
	mkdir -p ${startdir}/pkg/etc/rc.d
	mkdir -p ${startdir}/pkg/usr/share/man/man1
	
	install -m 755 skvm ${startdir}/pkg/usr/bin/skvm
	install -m 755 init/skvm ${startdir}/pkg/etc/rc.d/skvm
	sed "s/VERSION/${pkgver}/g" < skvm.1 > ${startdir}/pkg/usr/share/man/man1/skvm.1
	chmod 644 ${startdir}/pkg/usr/share/man/man1/skvm.1
}
