# Maintainer: Thomas Dziedzic < gostrc at gmail >
# Contributor: Patrick Jackson (arcuru) <patricksjackson*gmail>
# Contributor: Christoph Zeiler <rabyte*gmail>

pkgname=bloodfrontier
pkgver=0.85
pkgrel=2
pkgdesc='A single- and multiplayer FPS based on the Cube 2 (Sauerbraten) engine.'
arch=('i686' 'x86_64')
url='http://bloodfrontier.com/'
license=('ZLIB' 'custom')
depends=('sdl_image' 'sdl_mixer' 'libgl' 'gcc-libs' 'sh')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-B2-linux.tar.bz2"
        "$pkgname.desktop"
        'LICENSE')
md5sums=('814df812d14714687f44085c83d5b91b'
         'f768b778020f9a3835ca32f45f22f5ec'
         'a10fe08cb8d5643536700839e9a9b1b5')

build() {
  cd $pkgname/src

  make CXXOPTFLAGS="${CXXFLAGS}" all || return 1

  make install || return 1

  # Copy bin and data
  cd ..
  install -d "$pkgdir"/usr/{share/$pkgname/,}bin
  sed -i "s|BF_DATA=.|BF_DATA=/usr/share/$pkgname|" $pkgname.sh
  install -m755 $pkgname.sh "$pkgdir/usr/bin/$pkgname"
  install -m755 bin/bf{client,server} "$pkgdir/usr/share/$pkgname/bin"
  cp -rf data/ "$pkgdir/usr/share/$pkgname"

  # Install icon, desktop and license
  install -Dm644 src/xcode/help/bf32.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
