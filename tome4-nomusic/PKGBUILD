# Maintainer: Joao Cordeiro <jlcordeirolinux at gmail dot com> 

pkgname=tome4-nomusic
_pkgname=tome4
pkgver='1.0.0'
pkgrel=1
pkgdesc="An open-source, single-player, role-playing roguelike game set in the world of Eyal."
arch=('i686' 'x86_64')
url="http://tome.te4.org/"
license=('custom' 'GPL3')
depends=('mesa' 'glu' 'openal'
	'sdl-hg>=6687' 'sdl_ttf-hg>=222' 'sdl_image-hg>=339-2'
	'ttf-bitstream-vera' 'ttf-droid')
# another common font is ttf-fixedsys-excelsior-linux, but it is in AUR, so let it be
makedepends=('premake4' 'zip')
options=(!makeflags emptydirs)
source=("http://te4.org/dl/t-engine/t-engine4-src-${pkgver}-nomusic.tar.bz2"
        tome4build.patch)

md5sums=('1c5b6aedd5842feb30ab187aabdf8c09'
         'd1629b66b1983fea16fd983ea57f7c56')

export CFLAGS="-march=native -O1 -pipe"

build() {
    cd "$srcdir"/t-engine4-src-${pkgver}

    patch -p1 < "${srcdir}/tome4build.patch"

    premake4 gmake
    make
}

package() {
  cat <<EOF > tome4
#!/bin/sh
cd /usr/lib/${pkgname}
./t-engine
EOF

  cd t-engine4-src-${pkgver}

  install -d "${pkgdir}"/usr/share/doc/${pkgname}
  install -m644 CONTRIBUTING CREDITS "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 COPYING-TILES "${pkgdir}/usr/share/licenses/${pkgname}/COPYING-TILES"
  install -Dm755 t-engine "${pkgdir}/usr/lib/${pkgname}/t-engine"
  cp -r bootstrap/ game/ "${pkgdir}"/usr/lib/${pkgname}
  install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  zip -d "${pkgdir}"/usr/lib/${pkgname}/game/engines/te4-${pkgver}.teae \
	data/font/Vera.ttf \
	data/font/VeraBd.ttf \
	data/font/VeraIt.ttf \
	data/font/VeraMono.ttf \
	data/font/VeraMoBd.ttf \
	data/font/DroidSans.ttf \
	data/font/DroidSansMono.ttf \
	data/font/DroidSans-Bold.ttf \
	data/font/DroidSerif.ttf \
	data/font/DroidSerif-Bold.ttf \
	data/font/DroidSerif-Italic.ttf \
	data/font/DroidSerif-BoldItalic.ttf
}
