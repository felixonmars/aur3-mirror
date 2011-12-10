# Contributor: Tom K <tomk@runbox.com>
# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>
# Contributor: Christoph Zeiler <arch at moonblade dot org>
# Maintainer: Philipp Überbacher <murks at lavabit dot com>
pkgname=aeolus
pkgver=0.8.4
pkgrel=4
pkgdesc="A high quality pipe organ emulator using additive synthesis."
arch=('i686' 'x86_64')
url="http://kokkinizita.linuxaudio.org/linuxaudio/aeolus/index.html"
license=('GPL')
depends=('clalsadrv>=2.0.0' 'readline' 'clxclient>=3.6.1' 'jack')
install=aeolus.install
source=(http://kokkinizita.linuxaudio.org/linuxaudio/downloads/${pkgname}-${pkgver}.tar.bz2 \
http://kokkinizita.linuxaudio.org/linuxaudio/downloads/stops-0.3.0.tar.bz2 \
${pkgname}.conf
${pkgname}.patch
DSO.patch
)
md5sums=('0dcbfb2ab386419f306e1d947815163a'
         '2a7b1cae820408fa1cc655800d08d88f'
         '5df78c88f1f5c2d4cf0e50a18b784025'
         '022a2d3b62924b989796413873426937'
         '7de49cefb008d76ca012a35e013c9bab')

build() {

  mkdir -p ${pkgdir}/{etc,usr/bin,usr/lib,usr/share/${pkgname}}

  cd "${srcdir}/${pkgname}-${pkgver}/source"

  patch < ${srcdir}/${pkgname}.patch
  patch < ${srcdir}/DSO.patch
  make DESTDIR=${pkgdir} PREFIX="/usr" LIBDIR=lib
}

package(){
  cd "${srcdir}/${pkgname}-${pkgver}/source"
  make DESTDIR=${pkgdir} PREFIX="/usr" LIBDIR=lib install  
  cp -r "${srcdir}/stops-0.3.0" "${pkgdir}/usr/share/${pkgname}"
  chmod 644 ${pkgdir}/usr/share/${pkgname}/stops-0.3.0/*.ae0
  chmod 755 ${pkgdir}/usr/share/${pkgname}/{stops-0.3.0,stops-0.3.0/Aeolus*}
  install -m644 ../README "${pkgdir}/usr/share/${pkgname}"
  install -m644 "${srcdir}/aeolus.conf" "${pkgdir}/etc"
}
