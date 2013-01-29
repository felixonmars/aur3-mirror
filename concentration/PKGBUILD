# Contributor: Artiom Molchanov <ar.molchanov@gmail.com>
pkgname=concentration
pkgver=1.2
pkgrel=1
pkgdesc="A classical memory game"
arch=(x86_64)
url="http://web.archive.org/web/20080610124418/http://www.shiftygames.com/web2/index.php?module=game&name=Concentration"
license=('GPL')
groups=()
depends=(sdl_mixer sdl_ttf sdl_image)
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(http://web.archive.org/web/20060506064251/http://www.shiftygames.com/concentration/$pkgname-$pkgver.tar.gz $pkgname.png $pkgname.desktop)
noextract=()
md5sums=('f761f0cffcfbfcbe3b4f4a88904adb7c'
         'a0f56f45d40630a224374a78b5fb909e'
         '5c5daeb1fc78f0db3f319faa58e081a5')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir" install
  mkdir -p ${startdir}/pkg/usr/share/applications
  install -m644 ${startdir}/concentration.desktop ${startdir}/pkg/usr/share/applications/
  mkdir -p ${startdir}/pkg/usr/share/pixmaps
  install -m644 ${startdir}/concentration.png ${startdir}/pkg/usr/share/pixmaps/
}

