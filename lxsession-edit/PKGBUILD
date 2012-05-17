# Contributor: zoulnix <http://goo.gl/HQaP>
# Contributor: Vadim Dombrovski <pftbest@gmail.com>
pkgname=lxsession-edit
pkgver=0.2.0
pkgrel=2
pkgdesc="Tool to manage desktop session autostarts (part of LXDE)."
arch=('i686' 'x86_64')
url="http://lxde.org/"
license=('GPL')
depends=('gtk2')
makedepends=('autoconf' 'automake' 'gcc' 'intltool' 'make' 'patch' 'pkg-config')
options=('!libtool')
groups=('lxde')
source=(http://downloads.sourceforge.net/lxde/${pkgname}-${pkgver}.tar.gz)
md5sums=('1e763a9b7f297ba964cd41b30edfccd7')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  # fix for automake version 1.12 and higher
  sed -i '7 s/\\/]; then/; s/!=/\\</; 8d' ./autogen.sh

  # Generating build system
  ./autogen.sh || return 1

  ./configure --prefix=/usr \
	      --sysconfdir=/etc \
	      --localstatedir=/var \
	      --disable-static

  make || return 1
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  make DESTDIR=${pkgdir} install || return 1
}
