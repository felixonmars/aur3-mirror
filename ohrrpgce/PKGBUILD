# Maintainer: Jesse Jaara <gmail.com: jesse.jaara>

pkgname=ohrrpgce
pkgver=20130410
pkgrel=1
pkgdesc="Official Hamster Republic Role Playing Game Construction Engine"
arch=(i686 x86_64)
url="http://hamsterrepublic.com/ohrrpgce/Main_Page.html"
license=('GPL2')
if [ "$CARCH" = "x86_64" ]; then
	depends=('lib32-sdl_mixer' 'lib32-libxpm' 'lib32-libxrandr' 'lib32-ncurses')
	makedepends=('gcc-multilib' 'freebasic' 'scons' 'euphoria' 'dos2unix')
else
	depends=('sdl_mixer' 'euphoria' 'libxpm' 'libxrandr' 'ncurses')
	makedepends=('freebasic' 'scon' 'euphoria' 'dos2unix')
fi
optdepends=('timidity-freepats: midi music support')

source=(http://hamsterrepublic.com/ohrrpgce/archive/ohrrpgce-source-2013-04-10-beelzebufo.zip
	config.patch)

prepare() {
  cd "${srcdir}/beelzebufo"

  patch -Np1 -i ../config.patch

  sed 's|env python|env python2|' -i reloadbasic/reloadbasic.py
  chmod +x reloadbasic/reloadbasic.py

  dos2unix -o *.rbas
}

build() {
  cd "$srcdir/beelzebufo"

  scons debug=0 game custom hspeak unlump relump
  ./relump vikings/vikings.rpgdir ./vikings.rpg

}

package() {
  cd "${srcdir}/beelzebufo/"

  mv ohrrpgce-custom ohrrpgce-custom.bin
  echo -e "#!/bin/sh\ncd /usr/share/ohrrpgce\nexec ./ohrrpgce-custom.bin \"\${@}\""\
	> ohrrpgce-custom && chmod +x ohrrpgce-custom
  mkdir -p "${pkgdir}/usr/bin/"
  mkdir -p "${pkgdir}/usr/share/ohrrpgce/"
  mkdir -p "${pkgdir}/usr/share/doc/ohrrpgce/"

  cp hspeak ohrrpgce-{game,custom} {re,un}lump "${pkgdir}/usr/bin/"
  cp ohrrpgce-custom.bin "${pkgdir}/usr/share/ohrrpgce/"
  cp ohrrpgce.new plotscr.hsd scancode.hsi "${pkgdir}/usr/share/ohrrpgce/"

  cp ./vikings.rpg "${pkgdir}/usr/share/ohrrpgce/"
  cp -pr "vikings/Vikings script files" tmp
  cp -p "vikings/README-vikings.txt" tmp

  cp -r import "${pkgdir}/usr/share/ohrrpgce/"

  cp -r docs "${pkgdir}/usr/share/doc/ohrrpgce/"
  cp -r ohrhelp "${pkgdir}/usr/share/doc/ohrrpgce/"
}

md5sums=('eaec4042bbdc9e7824992bf272e75335'
         '0e71a80edeb002be0ed25df8bf998356')
