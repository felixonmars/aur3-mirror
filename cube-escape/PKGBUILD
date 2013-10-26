# Maintainer: Compintuit <permanentlylostinsightofland@gmail.com>

pkgname=cube-escape
pkgver=0.9
pkgrel=1
pkgdesc="Progress over a maze etched on the surface of a cube"
arch=('i686' 'x86_64')
url="http://code.google.com/p/cube-escape/"
license=('GPL')
depends=('sdl' 'sdl_image' 'sdl_ttf')
source=(http://cube-escape.googlecode.com/files/$pkgname-$pkgver.tar.gz 
    $pkgname.desktop 
    $pkgname.sh)
noextract=()

md5sums=('963b5c1f3d08d590387cafac57dc6e77'
         '0b16f88e3d102b5c739e755a2e9557ba'
         '1efe12192ccc839f33ecb24de81371b4')

build() {
  cd $srcdir/$pkgname-$pkgver
  make || return 1
  mkdir -p ${pkgdir}/usr/share/games/$pkgname/
  install -Dm755 ${srcdir}/$pkgname-$pkgver/$pkgname ${pkgdir}/usr/share/games/$pkgname/
  cp -r ${srcdir}/$pkgname-$pkgver/data ${pkgdir}/usr/share/games/$pkgname/
  install -Dm644 ${srcdir}/$pkgname-$pkgver/data/icon.png ${pkgdir}/usr/share/pixmaps/$pkgname.png
  install -Dm644 ${srcdir}/$pkgname.desktop ${pkgdir}/usr/share/applications/$pkgname.desktop
  install -Dm755 ${srcdir}/$pkgname.sh $pkgdir/usr/bin/$pkgname
}
