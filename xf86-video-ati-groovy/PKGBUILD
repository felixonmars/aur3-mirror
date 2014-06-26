# Maintainer: Matthew Coulson <jmcoulson@gmail.com>

pkgname=xf86-video-ati-groovy
_pkgname=xf86-video-ati
pkgver=7.3.0
epoch=1
pkgrel=2
pkgdesc="X.org ati video driver patched for low resolution CRT monitors"
arch=('i686' 'x86_64')
url="http://xorg.freedesktop.org/"
license=('custom')
depends=('libdrm>=2.4.41' 'systemd' 'ati-dri' 'glamor-egl')
makedepends=('xorg-server-devel' 'X-ABI-VIDEODRV_VERSION=15')
conflicts=('xorg-server<1.15.0' 'X-ABI-VIDEODRV_VERSION<15' 'X-ABI-VIDEODRV_VERSION>=16' 'xf86-video-ati')
provides=('xf86-video-ati')
replaces=('xf86-video-ati')
groups=('xorg-drivers' 'xorg')
source=("${url}/releases/individual/driver/${_pkgname}-${pkgver}.tar.bz2"
	'allow_low_res.diff'
	'dpm.diff'
	'dri2.diff')
sha256sums=('107c072c4919a996e04f47afdb53d5946a3ad574f270b8c560ef8b3a032046fe'
            '42ef790adcded01244a46f6a206d5adeee6643a2194ef4dada15c482491ff18d'
            '1714ea8337443d362af54b11011c88c1b2e972d9ae53846e9b81babb8abe21de'
            'a7a4d0d21f31ef1632b7f9f0e6eddf00bfa02da1a0e680a7cffd504a34436ae7')

prepare() {
  cd ${_pkgname}-${pkgver}  
  # Patches from GroovyArcade project for low resolution displays
  patch -p1 -i "${srcdir}/allow_low_res.diff"  
  patch -p1 -i "${srcdir}/dpm.diff"  
  patch -p1 -i "${srcdir}/dri2.diff"
}

build() {
  cd ${_pkgname}-${pkgver}
  
  ./configure --prefix=/usr \
    --enable-glamor
  make
}

package() {
  cd ${_pkgname}-${pkgver}

  make "DESTDIR=${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
