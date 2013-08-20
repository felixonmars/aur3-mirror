# $Id$
# Maintainer: Paul Mulders <justinkbe@gmail.com>

pkgname=zpython
pkgver=5.0.2
pkgrel=1
pkgdesc='Zsh python module'
arch=('i686' 'x86_64')
url='https://bitbucket.org/ZyX_I/zsh/src/zpython'
license=('custom')
depends=('python2' 'zsh')
source=("http://downloads.sourceforge.net/zsh/zsh-${pkgver}.tar.bz2"
        "https://gist.github.com/felixbuenemann/5790777/raw/cb5ea3b34617174e50fd3972792ec0944959de3c/zpython.patch")
md5sums=('b8f2ad691acf58b3252225746480dcad'
         'aec51045d61609958f157dbf0fa31775')

prepare() {
	cd "${srcdir}/zsh-${pkgver}"

	patch -Np1 -i "${srcdir}/zpython.patch"
	sed -i 's/subdir in Src Doc;/subdir in Src;/g' Makefile.in
}

build() {
	cd "${srcdir}/zsh-${pkgver}"

	./configure --prefix=/usr \
		--enable-etcdir=/etc/zsh \
		--enable-zshenv=/etc/zsh/zshenv \
		--enable-zlogin=/etc/zsh/zlogin \
		--enable-zlogout=/etc/zsh/zlogout \
		--enable-zprofile=/etc/zsh/zprofile \
		--enable-zshrc=/etc/zsh/zshrc \
		--enable-maildir-support \
		--with-term-lib='ncursesw' \
		--enable-multibyte \
		--enable-function-subdirs \
		--enable-fndir=/usr/share/zsh/functions \
		--enable-scriptdir=/usr/share/zsh/scripts \
		--with-tcsetpgrp \
		--disable-pcre \
		--disable-cap \
		--enable-zsh-secure-free \
		--disable-gdbm

	make
}

package() {
	cd "${srcdir}/zsh-${pkgver}/Src/Modules"

	install -D -m755 zpython.so "${pkgdir}/usr/lib/zpython/zsh/zpython.so"
}
