# Maintainer: Rustam Tsurik <rustam.tsurik@gmail.com>
# Contributor: Daniel Isenmann <daniel@archlinux.org>
# Contributor: Brice Carpentier <brice@dlfp.org>

pkgname=mono2
_pkgname=mono
pkgver=2.10.9
pkgrel=1
pkgdesc="Free implementation of the .NET platform including runtime and compiler, v2.10"
arch=(i686 x86_64)
license=('GPL' 'LGPL2' 'MPL' 'custom:MITX11')
url="http://www.mono-project.com/"
depends=('zlib' 'libgdiplus>=2.10' 'sh')
makedepends=('pkgconfig')
options=('!libtool' '!makeflags')
provides=('mono=$pkgver' 'monodoc')
conflicts=('mono' 'monodoc')
source=(http://download.mono-project.com/sources/${_pkgname}/${_pkgname}-${pkgver}.tar.bz2
        mono.binfmt.d)
md5sums=('bbbff9d3d0c36b904437ada36a27eb9e'
         'b9ef8a65fea497acf176cca16c1e2402')

build() {
  cd "${srcdir}"/${_pkgname}-${pkgver}
  # build mono
  ./configure --prefix=/usr --sysconfdir=/etc \
              --with-libgdiplus=installed 
  make

  # build jay
  cd "${srcdir}"/${_pkgname}-${pkgver}/mcs/jay
  make
}

package() {
  cd "${srcdir}"/${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install

  # install jay
  cd "${srcdir}"/${_pkgname}-${pkgver}/mcs/jay
  make DESTDIR="${pkgdir}" prefix=/usr INSTALL=../../install-sh install
  cd "${srcdir}"/${_pkgname}-${pkgver}

  # install binfmt conf file and pathes
  install -D -m644 "${srcdir}"/mono.binfmt.d "${pkgdir}"/usr/lib/binfmt.d/mono.conf

  #install license
  mkdir -p "${pkgdir}"/usr/share/licenses/${_pkgname}
  install -m644 mcs/MIT.X11 "${pkgdir}"/usr/share/licenses/${_pkgname}/
  
  #fix .pc file to be able to request mono on what it depends, fixes #go-oo build
  sed -i -e "s:#Requires:Requires:" "${pkgdir}"/usr/lib/pkgconfig/mono.pc
}
