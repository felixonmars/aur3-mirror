# $Id: PKGBUILD 65442 2010-01-29 07:48:24Z eric $
# Maintainer: Eric Belanger <eric@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>

pkgname=drscheme360
pkgver=360
pkgrel=1
pkgdesc="PLT Scheme Environment"
arch=('i686' 'x86_64')
url="http://www.drscheme.org/"
license=('LGPL')
depends=('gcc-libs' 'cairo' 'desktop-file-utils' 'libjpeg' 'mesa' 'openssl' 'libxaw' 'libxmu' 'libxft')
options=('!makeflags')
install=drscheme360.install
source=(http://download.plt-scheme.org/bundles/${pkgver}/plt/plt-${pkgver}-src-unix.tgz drscheme360.desktop libpng-1.4.patch)
md5sums=('84bcab3ff30c333ae3c6b732518bdf27'
         '62db1f7163404828f289c988ad111641'
		 'ec18faef466c1f18047d14a50be0413c')

build() {
  cd "${srcdir}/plt-${pkgver}/src"
  patch -p2 -i "${srcdir}/libpng-1.4.patch" || return 1
  ./configure --prefix=/opt/drscheme360 || return 1
  make LDFLAGS="" || return 1
  make LDFLAGS="" DESTDIR="${pkgdir}" install || return 1

  install -D -m644 ../collects/icons/plt.xpm "${pkgdir}/usr/share/pixmaps/drscheme360.xpm" || return 1
  install -D -m644 "${srcdir}/drscheme360.desktop" "${pkgdir}/usr/share/applications/drscheme360.desktop" || return 1

  mkdir -p "${pkgdir}/usr/bin" || return 1
  cd "${pkgdir}/usr/bin" || return 1
  ln -s ../../opt/drscheme360/bin/drscheme drscheme360 || return 1
}
