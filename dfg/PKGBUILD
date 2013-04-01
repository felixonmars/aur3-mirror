# Maintainer: Gadget3000 <gadget3000 at msn dot com>
# Contributor: Pnevma <Klavious@gmail.com>
# Contributor: djnm <nmihalich [at} gmail dott com>
# Contributor: ignus <m.a.lukasiewicz at gmail>
# Contributor: xnitropl <xnitropl at gmail dot com>

pkgname=dfg
pkgver=34_11
pkgrel=1
pkgdesc='Unofficial semi-graphic version of Dwarf Fortress'
arch=('i686' 'x86_64')
url='http://mayday.w.staszic.waw.pl/df.php'
license=('custom')
depends=('gtk2' 'sdl' 'sdl_image' 'libgl' 'sdl_ttf')
[ "$CARCH" = "x86_64" ] && depends=('lib32-glibc' 'lib32-gtk2' 'lib32-sdl_image' 'lib32-libgl' 'lib32-mesa' 'lib32-libxdamage' 'lib32-sdl_ttf') 
makedepends=('unzip')
conflicts=('dwarffortress' 'bin32-dwarffortress')
provides=('dwarffortress' 'bin32-dwarffortress')
install=$pkgname.install
source=(http://www.bay12games.com/dwarves/df_${pkgver}_linux.tar.bz2
        http://artgoblin.pl/upload/DFG/dfg_${pkgver}_win.zip
        dwarffortress
        dfg.desktop
        init.txt)
sha256sums=('720eda6c83e72fb1212a8eead0c39989ab5387bcf42dc4028a14e8df5bdd69e2'
            'fe332692de1d1020db40948aeb4aa9dcb8988646dcb9eec0b6ce78c2678df2d0'
            '8479497575f0f6b19effac9ee8ec23de119a06900b09b1f8a7771be19b4bb4a9'
            'a43011cf54b88c6607cf44eb01c0082150c87a6adaf61aed093db8ac4ecaef95'
            '19bfa6d89192fb4378eace06f976b17af7aa7407052b151ab59f2dfb9471adc7')

package() {
  cd ${srcdir}

  rm -r $srcdir/df_linux/raw
  cp -r $srcdir/raw $srcdir/df_linux/raw

  rm -r $srcdir/df_linux/data/art
  cp -r $srcdir/data/art $srcdir/df_linux/data/art

  cp $srcdir/data/init/embark_profiles.txt $srcdir/df_linux/data/init/embark_profiles.txt
  cp $srcdir/init.txt $srcdir/df_linux/data/init/init.txt

  mkdir -p $pkgdir/opt/
  cp -r $srcdir/df_linux $pkgdir/opt/df_linux

  if [ "$CARCH" = "x86_64" ] ; then
    ln -s /opt/lib32/usr/lib/libjpeg.so $pkgdir/opt/df_linux/libs/libjpeg.so.62
  fi
  
  chown -R root:games $pkgdir/opt/df_linux
  chmod -R 775 $pkgdir/opt/df_linux
  chmod 755 $pkgdir/opt/df_linux/df
  
  install -D -m755 $srcdir/dwarffortress $pkgdir/usr/bin/dwarffortress
  install -D -m644 $srcdir/df_linux/readme.txt $pkgdir/usr/share/licenses/dwarffortress/readme.txt
  install -D -m644 $srcdir/dfg.desktop $pkgdir/usr/share/applications/dfg.desktop
}
