# Maintainer: b00rt00s <b_ged@linuksowo.pl
# Contributor: Sam Madhani <shemz -at- gmx -dot- com>

pkgname=lyx-newest
_pkgname=lyx
pkgver=2.0.0
pkgrel=3
pkgdesc="A document processor with Tex/Latex backend."
arch=(i686 x86_64)
url='http://www.lyx.org'
license=('GPL')

depends=('qt' 'texlive-core' 'python2' 'perl' 'hunspell' 'imagemagick' 'libmythes' 'texlive-latex3' 'boost-libs')
optdepends=('texlive-latexextra: for more Latex packages' 'mythes-en: thesaurus data files')
makedepends=('boost')
provides=('lyx')
conflicts=('lyx' 'lyx-svn' 'lyx_prerelease' 'lyx-beta')
replaces=('lyx' 'lyx-svn' 'lyx_prerelease' 'lyx-beta')

source=(ftp://ftp.lip6.fr/pub/lyx/stable/2.0.x/lyx-${pkgver}.tar.xz
	lyx.desktop)
md5sums=('005dc04ad01e1b2bd92ec86b6235f8b1'
	 'b2a093f9dbbdeaa3dc085113c0f187c2')

install=lyx.install

build() {
  cd ${srcdir}/lyx-${pkgver}

  find . -type f -exec sed -i 's|#!.*python|#!/usr/bin/env python2|' {} +
  sed -i 's|"python|"python2|' lib/configure.py src/support/os.cpp
  
  ./configure PYTHON=/usr/bin/python2 --without-aspell \
    --without-enchant --prefix=/usr --with-frontend=qt4 \
    --without-included-boost --without-included-mythes \
    --disable-debug

  make || return 1
}

package() {
  cd ${srcdir}/lyx-${pkgver}
  
  make DESTDIR=${pkgdir} install || return 1

  # desktop entry
  install -Dm 644 ${srcdir}/lyx.desktop \
	${pkgdir}/usr/share/applications/lyx.desktop || return 1
}
