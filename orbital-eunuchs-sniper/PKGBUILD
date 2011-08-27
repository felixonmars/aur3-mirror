# Maintainer: Florian Léger <florian dot leger at insa dash rouen dot fr>

pkgname=orbital-eunuchs-sniper
pkgver=1.30
pkgrel=1
pkgdesc='An overhead shooting game.'
arch=('i686' 'x86_64')
url='http://icculus.org/oes/'
license=('ZLIB')
depends=('sdl' 'sdl_image' 'sdl_mixer')
optdepends=('xdg-utils: launch the default web browser')
source=("http://icculus.org/oes/orbital_eunuchs_sniper-${pkgver}.tar.gz"
        "${pkgname}-${pkgver}-gcc43.patch"
        "${pkgname}-${pkgver}-webbrowser.patch"
        "${pkgname}.desktop"
        "${pkgname}.png")
md5sums=('8b71cdfd835eeab1d974ca0e32f3e9d6'
         '5ef2bda7e97261e7b458453d56c731a0'
         'a95f3ea2df53726c0ec0459e838390d1'
         '434414a4afdbd9f98e092f913b615aab'
         'f4cc1b210b8275cd1e2cf97aa5c893ce')

build() {
  cd ${srcdir}/orbital_eunuchs_sniper-${pkgver}

  # Install the license
  install -D -m644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING || return 1

  # Install .desktop file
  install -D -m644 ${startdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop || return 1

  # Install icon (from Debian package)
  install -D -m644 ${startdir}/${pkgname}.png ${pkgdir}/usr/share/icons/${pkgname}.png || return 1

  # Patch for gcc >= 4.3 compatibility (from Gentoo's ebuild)
  patch -p0 -i ${srcdir}/${pkgname}-${pkgver}-gcc43.patch || return 1

  # Patch for default web browser
  patch -p0 -i ${srcdir}/${pkgname}-${pkgver}-webbrowser.patch || return 1

  # Build
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
}

