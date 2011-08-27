# Contributor: Roman Ajsin <aysin.roman@gmail.com>
pkgname=cubecombat-demo
pkgver=9.10.1
pkgrel=1
pkgdesc="Cube Combat is a Bomberman game optimized for lan and internet playing for (currently) up to four players."
arch=('i686' 'x86_64')
url="http://www.cubecombat.net"
license=('LGPL')
depends=('sdl' 'libvorbis' 'libjpeg' 'libpng' 'zlib')
makedepends=('imagemagick')
source=('http://www.cubecombat.net/download_file.php?file=16'
        'cubecombat-demo.desktop')
md5sums=('c7bbb3e3d8fa8ff079f428ee512c8e1f'
         'c4fc415aad0d50bb17030dc6a13d6213')

build() {
  mkdir -p "$pkgdir/opt/$pkgname" || return 1
  mkdir -p "$pkgdir/usr/bin" || return 1
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname" || return 1
  mkdir -p "$pkgdir/usr/share/pixmaps" || return 1
  mkdir -p "$pkgdir/usr/share/applications" || return 1

  cd "$srcdir"

  # game files
  #cp -r * "$pkgdir/opt/$pkgname" || return 1
  cp -r bin bin64 data cc.sh thirdparty_components.html changes.txt "$pkgdir/opt/$pkgname" || return 1
  ln -s "/opt/$pkgname/cc.sh" "$pkgdir/usr/bin/$pkgname" 

  # license
  install -m644 lgpl.html "$pkgdir/usr/share/licenses/$pkgname"
  
  # icon/.desktop
  convert "data/windowicon.ico" "$pkgdir/usr/share/pixmaps/$pkgname.png" || return 1
  install -m644 "$startdir/$pkgname.desktop" "$pkgdir/usr/share/applications"
}

# vim:set ts=2 sw=2 et:
