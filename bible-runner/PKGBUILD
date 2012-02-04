# Maintainer: Dylon Edwards <deltaecho@archlinux.us>

pkgname=bible-runner
pkgver=0.1
pkgrel=1

url="http://www.kde-apps.org/content/show.php/Bible+Runner?content=113367"
pkgdesc="A KDE Runner to quickly look up verses from the Holy Bible"
license=('GPLv2')

arch=('i686' 'x86_64')

source=("http://www.kde-apps.org/CONTENT/content-files/113367-biblerunner.tar.gz")
md5sums=('e6127d316051c7a7bf52662906c9cde3')

depends=('acl' 'attr' 'bzip2' 'expat' 'fontconfig' 'freetype2' 'gcc-libs' 'glib2' 'glibc' 'kdelibs' 'libice' 'libpng' 'libsm' 'libx11' 'libxau' 'libxcb' 'libxcursor' 'libxdmcp' 'libxext' 'libxfixes' 'libxml2' 'libxrender' 'libxtst' 'libgl' 'openssl' 'pcre' 'qt' 'sqlite3' 'strigi' 'util-linux-ng' 'xz-utils' 'zlib')
makedepends=('cmake' 'automoc4')

function build()
{
	cd biblerunner

	if [[ -d build ]]; then
		rm -rf build || return 1
	fi

	mkdir build && cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	make || return 1
}

function package()
{
	cd biblerunner/build
	make DESTDIR="${pkgdir}" install || return 1
}
