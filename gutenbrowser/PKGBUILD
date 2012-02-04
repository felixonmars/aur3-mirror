# Gutenbrowser
# Contributor: Dylon Edwards <deltaecho@archlinux.us>

pkgname=gutenbrowser
pkgver=0.9.0
_pkgrev=2
pkgrel=2
pkgdesc="A reader for eTexts produced by Project Gutenberg."
url="http://sourceforge.net/projects/gutenbrowser/"
depends=('qt' 'libpng' 'freetype2' 'expat' 'pcre' 'zlib' 'sqlite3' 'glibc' 'gcc-libs')
makedepends=('binutils')
arch=('i686' 'x86_64')
if [ ${CARCH} == i686 ]; then
	ARCH='i386'
else
	ARCH='amd64'
fi
license=('GPL2')
provides=('gutenbrowser')
source=(http://archive.ubuntu.com/ubuntu/pool/universe/g/${pkgname}/${pkgname}_${pkgver}-${_pkgrev}_${ARCH}.deb
	http://archive.ubuntu.com/ubuntu/pool/universe/g/${pkgname}/${pkgname}_${pkgver}.orig.tar.gz
	gutenbrowser.desktop)
md5sums=('9bfa28d519e389737ea0cfbd4cd829c0'
	 'a8c0594c6b8ba2f20184d1f73c60479d'
	 '028f4be3605038dcc3b034d029f16cde'
	 '1c1b8c2c926633361a913d632e06d478')

build() {
	# Enter the working directory
	cd ${startdir}/src

	# Unpack the archives
	msg "Unpacking files..."
	ar -x ${pkgname}_${pkgver}-${_pkgrev}_${ARCH}.deb && tar -xvf data.tar.gz || return 1
	msg "Done./n"

	msg "Now installing to the fakeroot directory..."

	# Remove any unneeded directories
	rm -rf usr/share/menu \
	       usr/share/doc

	# Install to the fakeroot directory
	cp -R usr $pkgdir/usr
	install -D $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
	install -D $pkgname/images/$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
}
