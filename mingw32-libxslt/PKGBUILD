# Contributor: m0rph (m0rph.mailbox@gmail.com)

pkgname=mingw32-libxslt
pkgver=1.1.26
pkgrel=1
pkgdesc="XML stylesheet transformation library (mingw32)"
arch=('i686' 'x86_64')
url="http://xmlsoft.org/XSLT/"
license=('custom')
depends=('mingw32-libxml2>=2.7.7' 'libgcrypt>=1.4.6')
makedepends=('mingw32-gcc' 'python2')
options=('!strip' '!libtool')
source=(ftp://xmlsoft.org/libxslt/libxslt-${pkgver}.tar.gz)
md5sums=('e61d0364a30146aaa3001296f853b2b9')

build()
{
	cd "${srcdir}/libxslt-${pkgver}"

	unset LDFLAGS
#  export CFLAGS="${CFLAGS} -mms-bitfields"

	./configure \
		--prefix=/usr/i486-mingw32 \
		--host=i486-mingw32 \
		--build="${CHOST}" \
		--without-python \
		--without-crypto \
		--with-libxml-include-prefix=/usr/i486-mingw32/include/libxml2 \
		--with-libxml-libs-prefix=/usr/i486-mingw32/lib

	make
}

package()
{
	cd "${srcdir}/libxslt-${pkgver}"

	make install DESTDIR="${pkgdir}"

	rm -rf "${pkgdir}/usr/i486-mingw32"/{share/{doc,gtk-doc},man}
}
