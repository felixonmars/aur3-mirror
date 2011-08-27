# $Id: PKGBUILD 46423 2009-07-18 07:32:07Z giovanni $
# Maintainer: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>

pkgname=ctags-css
_realname=ctags
pkgver=5.8
pkgrel=1
pkgdesc="Generates an index file of language objects found in source files, with patch for CSS parsing"
arch=('i686' 'x86_64')
license=('GPL')
depends=('glibc')
conflicts=('ctags')
provides=('ctags')
url="http://ctags.sourceforge.net/"
source=(http://downloads.sourceforge.net/sourceforge/${_realname}/${_realname}-${pkgver}.tar.gz
        css.patch)
md5sums=('c00f82ecdcc357434731913e5b48630d'
         '41069ead4cc0debaecd69da9bb06f371')

build() {
  cd ${srcdir}/${_realname}-${pkgver}
  patch -Np0 -i "../css.patch" || return 1
  ./configure --prefix=/usr
  make || return 1
  make prefix=${pkgdir}/usr install
}

