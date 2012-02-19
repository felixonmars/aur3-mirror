# Maintainer:  Testuser_01 <arch@nico-siebler.de>

pkgname=freetz-svn
pkgver=8673
pkgrel=1
pkgdesc="Freetz is a firmware-extension (modification) for the AVM Fritz!Box and devices with identical hardware. \
You can build your own firmware images. This is the latest SVN revision from the trunk"
url="http://http://freetz.org/"
arch=('any')
source=('freetz-copy-repository')
sha512sums=('cad52bf2b291166ec421685a04ee6fc5155822f1f61f4b42f07c7428a66b0419c839a24f50f7134b52b78f0c43de3e6c440180cee391c500fc5700894d928290')
install="${pkgname}.install"
license=('GPL')
if [ "$CARCH" = "x86_64" ]; then
	depends=('glibc' 'lib32-glibc' 'gcc-multilib' 'binutils-multilib' 'autoconf' 'automake' 'libtool' 'make' 'bzip2'
		 'ncurses' 'lib32-ncurses' 'zlib' 'flex' 'bison' 'patch' 'patchutils' 'texinfo' 'tofrodos'
		 'gettext' 'pkg-config' 'eclipse-ecj' 'perl' 'perl-string-crc32' 'xz' 'coreutils'
		 'svn' 'ruby' 'gawk' 'python2' 'python' 'libusb' 'usbutils' 'fastjar' 'git'
		 'graphicsmagick')
else
	depends=('glibc' 'gcc' 'binutils' 'autoconf' 'automake' 'libtool' 'make' 'bzip2' 'ncurses' 'zlib' 'flex'
		 'bison' 'patch' 'patchutils' 'texinfo' 'tofrodos' 'gettext' 'pkg-config' 'eclipse-ecj'
		 'perl' 'perl-string-crc32' 'xz' 'coreutils' 'svn' 'ruby' 'gawk' 'python2' 'python'
		 'libusb' 'usbutils' 'fastjar' 'git' 'graphicsmagick')
fi

_svntrunk="http://svn.freetz.org/trunk"
_svnmod="${pkgname}-trunk"

build() {
	cd "${srcdir}" || return 1

	msg "Connecting to SVN server...." || return 1

	if [ -d $_svnmod/.svn ]; then
    		(cd $_svnmod && svn up) || return 1
  	else
    		svn co $_svntrunk --config-dir ./ $_svnmod || return 1
  	fi

  	msg "SVN checkout done or server timeout" || return 1
}


package() {
	cd "${srcdir}/" || return 1
	install -dm755 "${pkgdir}/opt/${pkgname}" || return 1
	cp -fr "${pkgname}-trunk" "${pkgdir}/opt/${pkgname}" || return 1
	install -D -dm755 "${pkgdir}/usr/bin" || return 1
	install -m755 'freetz-copy-repository' "${pkgdir}/usr/bin" || return 1
	msg "This is the build environment only to compile your firmware image! I'm NOT responsible for any damage!" || return 1
}
