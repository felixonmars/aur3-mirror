# Contributor: Jens Pranaitis <jens@jenux.homelinux.org>
# Contributor: Shino <shino@jenux.homelinux.org>
# Contributor: phara0h <jan@das-labor.org>

pkgname="radare-git"
pkgver=20130716
pkgrel=1
pkgdesc="A collection of tools with the aim to create a complete, portable, multi-architecture, unix-like toolchain for reverse engineering."
arch=('i686' 'x86_64')
url="http://radare.org"
license=('GPL2')
depends=('bash' 'perl' 'python2' 'vala')
makedepends=('git')
optdeps=('vte: GUI support')
provides=("radare")
conflicts=("radare" "radare-git")

_gitroot="https://github.com/radare/radare.git"
_gitname="radare"

build() {
	cd ${srcdir}

  if [ -d ${_gitname}-build ]; then
    msg "Removing old build-dir"
    rm -rf ${_gitname}-build
  fi

  if [ -d ${_gitname} ]; then
    cd ${_gitname}
    git pull --rebase
  else
    git clone ${_gitroot} ${_gitname}
	fi

  cd ${srcdir}
  git clone ${_gitname} ${_gitname}-build

  cd ${_gitname}-build
	
	#Python2 patches
	sed -i -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" ./gui/wscript_build
	sed -i -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" ./src/arch/arm/aasm/wscript_build
	sed -i -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" ./src/javasm/wscript_build
	sed -i -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" ./src/plug/hack/wscript_build
	sed -i -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" ./src/plug/io/wscript_build
	sed -i -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" ./src/rabin/wscript_build
	sed -i -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" ./src/radiff/wscript_build
	sed -i -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" ./src/rahash/wscript_build
	sed -i -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" ./src/rasc/wscript_build
	sed -i -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" ./src/rasm/wscript_build
	sed -i -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" ./src/rsc/wscript_build
	sed -i -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" ./src/wscript_build
	sed -i -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" ./vala/grava/wscript_build
	sed -i -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" ./vala/wscript_build
	sed -i -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" ./wscript

	msg "Configuring..."
	./configure --prefix=/usr --without-ewf

	msg "Building..."
	make
}

package() {
	cd ${srcdir}/${_gitname}-build

	msg "Installing..."
	make DESTDIR=${pkgdir} install

	install -d "${pkgdir}/usr/share/man/man1"
	install -m644 man/* "${pkgdir}/usr/share/man/man1"

	sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
	       -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
	       $(find $pkgdir -name '*.py')

	cd ${srcdir}
	#rm -rf ${_gitname}-build
}
