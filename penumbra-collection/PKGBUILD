# Maintainer: Gerardo Marset <gammer1994@gmail.com>
# Contributor: Gen2ly <toddrpartridge@gmail.com>

pkgname=penumbra-collection
pkgver=1.1
pkgrel=3
pkgdesc="A first person adventure game which focuses on story, immersion, and puzzles."
arch=('i686' 'x86_64')
url="http://www.penumbragame.com/"
license=('custom')
[ "${CARCH}" = "x86_64" ] && depends=('lib32-gcc-libs' 'lib32-libvorbis' 'lib32-libxft' 'lib32-mesa' 'lib32-sdl' 'lib32-libogg' 'lib32-openal')
[ "${CARCH}" = "i686" ] && depends=('gcc-libs' 'libvorbis' 'libxft' 'mesa' 'sdl' 'libogg' 'openal')
optdepends=('lib32-nvidia-utils: Accelerated 3D with Nvidia driver'
            'lib32-catalyst-utils: Accelerated 3D with ATI driver')
install="$pkgname.install"
_sh=penumbra_collection_$pkgver.sh
_pov=penumbra-overture
_pbp=penumbra-blackplague
_pre=penumbra-requiem
source=($_sh collectionkey $_pov.desktop $_pbp.desktop $_pre.desktop $pkgname.install)
md5sums=('d9ae143516e0873f3d26c4c3fd6b9df1'
         '84cae4dd5c35348114b473257ea8603f'
         'fede70a855e6ac288ea15f802ebb1e79'
         '1225ac609feb0dd853ffc74fc31c1c0f'
         'efa1984afa0cc5b99b1348177878699a'
         '865217d5dd5870d16cf7ed14bf36abbd')

build() {
  # Extract installer.
  if [ ! -d $srcdir/$pkgname-$pkgver ]; then
    mkdir -p $srcdir/$pkgname-$pkgver
  fi
  msg "Extracting archive..."
  sh $_sh --tar xf -C $srcdir/$pkgname-$pkgver 
  cd $srcdir/$pkgname-$pkgver

  case $CARCH in
    i686) _arch=x86 ;;
    x86_64) _arch=x86_64 ;;
  esac
  ./bin/linux/$_arch/libc.so.6/lzma-decode ./subarch - 2>/dev/null | tar xvf - 2>&1
  tar --lzma -xf instarchive_all

  # Create pkgdir folders.
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/{applications,games/$pkgname,icons}
  mkdir -p $pkgdir/usr/share/licenses/$pkgname

  # Install files.
  msg "Copying files..."

  install -m644 config/license $pkgdir/usr/share/licenses/$pkgname/LICENSE

  cd $srcdir/$pkgname-$pkgver/PenumbraCollection/

  # Fix the path in startup scripts.
  sed -i -e 's|`dirname ${0}`|/usr/share/games/'$pkgname'|' blackplague overture requiem
  # Copy the game folder.
  cp -r * $pkgdir/usr/share/games/$pkgname
  
  #rm $pkgdir/usr/share/games/penumbra-collection/*/lib/lib{openal,ogg,vorbis}*

  # Make executable links.
  ln -s /usr/share/games/$pkgname/overture $pkgdir/usr/bin/$_pov
  ln -s /usr/share/games/$pkgname/blackplague $pkgdir/usr/bin/$_pbp
  ln -s /usr/share/games/$pkgname/requiem $pkgdir/usr/bin/$_pre

  # Install icons and .desktop files.
  install -m644 Overture/penumbra.png $pkgdir/usr/share/icons/$_pov.png
  install -m644 BlackPlague/penumbra.png $pkgdir/usr/share/icons/$_pbp.png
  install -m644 BlackPlague/requiem.png $pkgdir/usr/share/icons/$_pre.png
  install -m644 $startdir/$_pov.desktop $pkgdir/usr/share/applications/
  install -m644 $startdir/$_pbp.desktop $pkgdir/usr/share/applications/
  install -m644 $startdir/$_pre.desktop $pkgdir/usr/share/applications/

  # Install the serial number file.
  install -m644 $startdir/collectionkey $pkgdir/usr/share/games/$pkgname/
}
