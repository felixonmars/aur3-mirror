# Maintainer: Alfredo Palhares <masterkorp@masterkorp.net>

pkgname=ctags-d
pkgver=5.8
pkgrel=3
pkgdesc="Ctags patched with D Programing Language Support"
arch=('i686' 'x86_64')
license=('GPL')
depends=('glibc')
conflicts=('ctags')
url="http://www.prowiki.org/wiki4d/wiki.cgi?ReferenceForTools/ExuberantCtags"
source=("http://downloads.sourceforge.net/sourceforge/ctags/ctags-${pkgver}.tar.gz"
"d.patch")
md5sums=('c00f82ecdcc357434731913e5b48630d'
         '86636f80f1d7d5719108ff945eecfb62')

build() {
  cd ${srcdir}/ctags-${pkgver}

  #Apply the patch
  patch < ../../d.patch

  ./configure --prefix=/usr \
              --disable-external-sort
  make
}

package() {
  cd ${srcdir}/ctags-${pkgver}

  make prefix=${pkgdir}/usr install
}
