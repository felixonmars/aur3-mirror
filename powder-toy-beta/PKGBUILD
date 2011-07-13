# Maintainer: Jesse Jaara <mail.ru: jesse.jaara>

pkgname=powder-toy-beta
pkgver=52.0
pkgrel=1
pkgdesc="Desktop version of the classic falling sand physics sandbox,simulates air pressure, velocity & heat!"
arch=(i686 x86_64)
depends=('sdl' 'lua')
url="http://powdertoy.co.uk/"
license=('GPL2')
source=(https://github.com/FacialTurd/The-Powder-Toy/tarball/51.0
		$pkgname.desktop $pkgname.png powder-beta.sh 52.0.patch)
noextract=(51.0)

build() {
  cd "${srcdir}/"

  mkdir -p powder-${pkgver}
  bsdtar xf 51.0 -C powder-${pkgver}/
  cd powder-${pkgver}/*

  patch -Np1 -i ../../52.0.patch
  sed 's|VERSION 51|VERSION 52|' -i ./includes/defines.h

  sed 's|echo python|echo python2|' -i Makefile
  sed 's|-llua5.1|-llua|' -i Makefile
  sed 's|lua5.1/||' -i includes/luaconsole.h

  if [[ "${CARCH}" == "i686" ]];then
	sed 's|-march=native|-march=i686|' -i Makefile
	make powder-sse{,2,3}
  else
        sed 's|-march=native|-march=x86-64|' -i Makefile
	make powder-64-sse{2,3}
  fi
}


package() {
  cd "${srcdir}"/powder-${pkgver}/*

  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}"/usr/share/{applications,icons,powder-beta}

  if [[ "${CARCH}" == "i686" ]];then
        cp build/powder-sse{,2,3} "${pkgdir}/usr/share/powder-beta/"
  else
        cp build/powder-64-sse{2,3} "${pkgdir}/usr/share/powder-beta/"
  fi

  cp "${srcdir}/powder-beta.sh"	"${pkgdir}/usr/bin/powder-beta"
  cp "${srcdir}/$pkgname.desktop"		"${pkgdir}/usr/share/applications"
  cp "${srcdir}/$pkgname.png"		"${pkgdir}/usr/share/icons"
}

md5sums=('85003b0bf3e395527bc3090b066edfa8'
         '264dc60caa19352030b4d92ee2023532'
         'bb40bf9c2fa3982e2872b5d32de3b006'
         '23393b2fd4368d0ce2bae1bc215da32d'
         'ac2704255fb9ca9d9e84f4654ca85725')
