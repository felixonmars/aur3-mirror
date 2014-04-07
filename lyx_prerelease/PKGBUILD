# Contributor: Sam Madhani <shemz -at- gmx -dot- com>
# Contributor: Mark Coolen < mark dot coolen at gmail dot com >

pkgname=lyx_prerelease
pkgver=2.1.0
pkgrel=2
_pkgrel=rc1
pkgdesc="A document processor with Tex/Latex backend."
arch=(i686 x86_64)
url='http://www.lyx.org'
license=('GPL')
depends=('qt4' 'texlive-core' 'python2' 'hunspell' 'imagemagick' 'libmythes')
optdepends=('texlive-most: for common Latex packages' 'mythes-en: thesaurus data files')
makedepends=('boost')
provides=('lyx')
conflicts=('lyx' 'lyx-svn')
replaces=('lyx' 'lyx-svn')

source=(ftp://ftp.lyx.org/pub/lyx/devel/lyx-2.1/lyx-${pkgver}${_pkgrel}/lyx-${pkgver}${_pkgrel}.tar.xz
	lyx.desktop)
md5sums=('d517609fffa83f31f39214da8e6dcfbc'
	 'b2a093f9dbbdeaa3dc085113c0f187c2')

install=lyx.install

build() {
  cd ${srcdir}/lyx-${pkgver}${_pkgrel}

  find . -type f -exec sed -i 's|#!.*python|#!/usr/bin/env python2|' {} +
  sed -i 's|"python|"python2|' lib/configure.py src/support/os.cpp
  
  ./configure PYTHON=/usr/bin/python2 --without-aspell \
    --without-enchant --prefix=/usr --with-frontend=qt4 \
    --enable-build-type=pre --enable-warnings \
    --without-included-boost --without-included-mythes

  make
}

package() {
  cd ${srcdir}/lyx-${pkgver}${_pkgrel}
  
  make DESTDIR=${pkgdir} install-strip

  # desktop entry
  install -Dm 644 ${srcdir}/lyx.desktop \
	${pkgdir}/usr/share/applications/lyx.desktop
}
