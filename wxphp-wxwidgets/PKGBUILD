# Maintainer: Andrew Rose <hello@andrewrose.co.uk>
# Contributor: Andrew Rose <hello@andrewrose.co.uk>

pkgname=wxphp-wxwidgets
pkgdesc='wxWidgets is a C++ library that lets developers create applications for Windows, Mac OS X, Linux and other platforms with a single code base.'
pkgver=3.0.1
pkgrel=1

arch=('x86_64' 'i686')
url='https://www.wxwidgets.org/'
license=('wxWindows licence')

makedepends=('gtk3' 'wayland')

# http://trac.wxwidgets.org/changeset/75182 so using latest SVN source, for now..

#source=("http://downloads.sourceforge.net/wxwindows/wxWidgets-${pkgver}.tar.bz2")
#md5sums=('241998efc12205172ed24c18788ea2cd')

source=("svn+https://svn.wxwidgets.org/svn/wx/wxWidgets/trunk")
md5sums=('SKIP')

depends=('gtk3' 'wayland')

build() {

#	cd "${srcdir}/wxWidgets-${pkgver}"
	cd "${srcdir}/trunk"
	./configure --prefix=/usr --with-{gtk=3,libjpeg=sys,libpng=sys,libtiff=sys,libxpm=sys,opengl,regex=builtin,sdl} \
		--enable-{aui,graphics_ctx,unicode}
	make
}

package_wxphp-wxwidgets() {

	cd "${srcdir}/trunk"
	make DESTDIR=${pkgdir} install
}
