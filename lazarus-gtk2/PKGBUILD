# Contributor: Aleš Katona <almindor@gmail.com>
# Contributor: Benedikt "linopolus" Mueller <linopolus@gmx.com>
# Contributor: Alessio 'Blaster' Biancalana <dottorblaster@gmail.com>

pkgname=lazarus-gtk2
pkgver=0.9.30.2
pkgrel=1
pkgdesc="Delphi-like IDE for FreePascal - Gtk2 interface"
arch=('i686' 'x86_64')
url="http://www.lazarus.freepascal.org/"
license=('GPL2' 'MPL' 'custom:LGPL')
depends=('fpc>=2.2.4' 'fpc-src' 'gtk2>=2.10')
makedepends=('imagemagick' 'sed' 'wget')
provides=(lazarus)
conflicts=(lazarus)
options=('!emptydirs' '!makeflags')
source=(http://sourceforge.net/projects/lazarus/files/Lazarus%20Zip%20_%20GZip/Lazarus%200.9.30.2/lazarus-0.9.30.2-src.tar.bz2/download)
md5sums=('0dcf54613c2f9d38a32d183431e2dfc9')

build() {
  cd "$srcdir/lazarus"
  # don't 'make examples' or you'll end up with a 100MB pkg
  make LCL_PLATFORM="gtk2" clean all || return 1
  # skip the 'make install' mess completely and do everything manually
  mkdir -p ${startdir}/pkg/usr/lib/lazarus ${startdir}/pkg/usr/bin ${startdir}/pkg/usr/share/pixmaps
  rm -r debian # :>
  cp -R . ${startdir}/pkg/usr/lib/lazarus
  ln -s /usr/lib/lazarus/lazarus ${startdir}/pkg/usr/bin/lazarus
  ln -s /usr/lib/lazarus/startlazarus ${startdir}/pkg/usr/bin/startlazarus
  ln -s /usr/lib/lazarus/lazbuild ${startdir}/pkg/usr/bin/lazbuild
  install -Dm644 install/man/man1/lazbuild.1 ${startdir}/pkg/usr/share/man/man1/lazbuild.1
  # make 'desktop-file-validate' happy and fix missing .png icon
  sed -e 's|\(Categories\).*|\1=IDE;Development;|' -i install/lazarus.desktop
  install -Dm644 install/lazarus.desktop ${startdir}/pkg/usr/share/applications/lazarus.desktop
  convert images/icons/lazarus.ico ${startdir}/pkg/usr/share/pixmaps/lazarus.png
  mv ${startdir}/pkg/usr/share/pixmaps/lazarus-0.png ${startdir}/pkg/usr/share/pixmaps/lazarus.png
  rm -r ${startdir}/pkg/usr/lib/lazarus/install
  # license files: /usr/lib/lazarus/COPYING*
  install -D -m644 COPYING.modifiedLGPL.txt $startdir/pkg/usr/share/licenses/$pkgname/COPYING.modifiedLGPL.txt
}
