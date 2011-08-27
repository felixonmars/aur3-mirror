# $Id: PKGBUILD 78139 2010-04-19 22:08:32Z dgriffiths $
# Contributor: Eric Belanger <eric@archlinux.org>
# imagemagick Maintainer: DAniel J Griffiths <ghost1227@archlinux.us>
# imagemagick-nox Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=imagemagick-nox
pkgver=6.6.4.0
pkgrel=1
pkgdesc="An image viewing/manipulation program, without X dependencies"
arch=('i686' 'x86_64')
url="http://www.imagemagick.org/"
license=('custom')
depends=('lcms' 'gcc-libs' 'openexr>=1.6.1' 'libtool' 'heimdal' 'bzip2' 'libxml2' 'liblqr')
provides=('imagemagick')
options=('!makeflags' '!docs')

source=(ftp://ftp.imagemagick.org/pub/ImageMagick/ImageMagick-${pkgver%.*}-${pkgver##*.}.tar.xz \
        libpng_mmx_patch_x86_64.patch
	perlmagick.rpath.patch)

build() {
	cd ${srcdir}/ImageMagick-${pkgver%.*}-${pkgver##*.}

	if [ "${CARCH}" = 'x86_64' ]; then
		patch -Np1 < ../libpng_mmx_patch_x86_64.patch || return 1
	fi

	patch -p0 < ../perlmagick.rpath.patch || return 1

	./configure --prefix=/usr --with-modules --disable-static \
	    --enable-openmp --without-x --without-wmf --with-openexr --with-xml \
	    --without-gslib \
	    --with-perl --with-perl-options="INSTALLDIRS=vendor" \
	    --without-gvc --without-djvu --without-autotrace --with-jp2 \
	    --without-jbig --without-fpx --without-dps || return 1
	make || return 1
}

package() {
	cd ${srcdir}/ImageMagick-${pkgver%.*}-${pkgver##*.}

	make DESTDIR=${pkgdir} install || return 1

	install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE || return 1
	install -Dm644 NOTICE ${pkgdir}/usr/share/licenses/${pkgname}/NOTICE || return 1

	#Cleaning
	find ${pkgdir} -name '*.bs' -exec rm {} \; || return 1
	rm -f ${pkgdir}/usr/lib/*.la || return 1
}

md5sums=('aa01e476ca4b2b87905c7449f4897249'
         '069980fc2590c02aed86420996259302'
         'ff9974decbfe9846f8e347239d87e4eb')
sha1sums=('77667cff481dff66febdc22051b59e257eee1808'
          'e42f3acbe85b6098af75c5cecc9a254baaa0482c'
          '23405f80904b1de94ebd7bd6fe2a332471b8c283')
