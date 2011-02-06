# Contributor: robb_force <robb_force@holybuffalo.net>

pkgname=wolfmame
_srcname=sdlmame
pkgver=0.126
pkgrel=1
pkgdesc="A patched version of SDLMAME recommended for use with the MAME Action Replay Page."
url="http://rbelmont.mameworld.info/?page_id=163"
license=('custom:MAME License')
arch=('i686' 'x86_64')
depends=('sdl>=1.2.11' 'gconf>=2.0')
makedepends=('nasm')
DLAGENTS=('http::/usr/bin/wget -c -t 3 --waitretry=3 --user-agent=Mozilla/5.0')
source=(http://rbelmont.mameworld.info/${_srcname}${pkgver%.*}${pkgver#*.}.zip \
  http://wolfmame.marpirc.net/inpview14-${pkgver#*.}.zip \
  http://wolfmame.marpirc.net/wolf${pkgver#*.}.zip \
  wolfmame.sh \
  extras.tar.gz)
install=wolfmame.install
md5sums=('4261cb7e092a1cdad440742bf24e95a0'
         '3cb928930e01ded428eb57c38e54ccc6'
         '7808c9469fd05bb3d0c371d74f5e08dd'
         'f30d92f397377317e2aa302da86b1ccd'
         '420b61240bf5ae11615ba7c6100ee00d')

build() {
  cd ${startdir}/src/${_srcname}${pkgver%.*}${pkgver#*.}

  # Move the patch files, remove carriage returns, then patch the source
  mv ${startdir}/src/*.diff ${startdir}/src/${_srcname}${pkgver%.*}${pkgver#*.}
  for i in *.diff; do
    sed -e 's/\r$//' -i $i
    patch -p1 < $i || return 1
  done

  # These changes allow SDLMAME to compile with GCC 4.2+
  sed -e 's|CFLAGS += -Werror|#CFLAGS += -Werror|' \
    -i makefile

  # Modify the make options based on the user's architecture
  if [ "$CARCH" == "x86_64" ]; then
    echo "Compiling for AMD64..."
    make AMD64=1 PTR64=1 || return 1
  elif [ "$CARCH" == "i686" ]; then
    echo "Compiling for i686..."
    make I686=1 || return 1
  else
    echo "Compiling for i386..."
    make PM=1 || return 1
  fi

  # Install the wolfmame script
  install -Dm755 ${startdir}/src/${pkgname}.sh ${startdir}/pkg/usr/bin/${pkgname} 

  # Install the applications and the UI font in /usr/share
  install -Dm755 mame ${startdir}/pkg/usr/share/${pkgname}/${pkgname}
  install -m755 chdman ${startdir}/pkg/usr/share/${pkgname}/chdman
  install -m755 jedutil ${startdir}/pkg/usr/share/${pkgname}/jedutil
  install -m755 makemeta ${startdir}/pkg/usr/share/${pkgname}/makemeta
  install -m755 regrep ${startdir}/pkg/usr/share/${pkgname}/regrep
  install -m755 romcmp ${startdir}/pkg/usr/share/${pkgname}/romcmp
  install -m755 runtest ${startdir}/pkg/usr/share/${pkgname}/runtest
  install -m755 testkeys ${startdir}/pkg/usr/share/${pkgname}/testkeys
  install -m644 ui.bdf ${startdir}/pkg/usr/share/${pkgname}/ui.bdf

  # Install the extra bits
  install -d ${startdir}/pkg/usr/share/${pkgname}/{artwork,ctrlr,keymaps}
  install -m644 ${startdir}/src/artwork/* ${startdir}/pkg/usr/share/${pkgname}/artwork/
  install -m644 ${startdir}/src/ctrlr/* ${startdir}/pkg/usr/share/${pkgname}/ctrlr/
  install -m644 keymaps/* ${startdir}/pkg/usr/share/${pkgname}/keymaps/

  # Include the license
  install -Dm644 docs/license.txt $startdir/pkg/usr/share/licenses/custom/${pkgname}/license.txt
}
