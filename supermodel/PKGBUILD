# Maintainer: Anton Shestakov <engored*ya.ru>

pkgname=supermodel
pkgver=0.2a
pkgrel=1
pkgdesc='A Sega Model 3 Arcade Emulator'
arch=('i686' 'x86_64')
url='http://www.supermodel3.com/'
license=('GPL3')
depends=('mesa' 'sdl' 'zlib')
install=supermodel.install
source=('multiuser.patch' 'supermodel.sh' 
        "http://www.supermodel3.com/Files/Supermodel_${pkgver}_Src.zip")
md5sums=('a7cf136e412a0d927b099c15793b658d' 'ea8274c2a37acddd026fce9c831530cc'
        'd7328d28adab21ed0896c2aae988d1d8')

MAKEFLAGS="-j1"

build() {
  cd "$srcdir/Supermodel_${pkgver}_Src"
  sed -e "s/-Wall -O3/$CFLAGS/" -i 'Makefiles/Makefile.SDL.UNIX.GCC'
  patch -p1 < ../multiuser.patch
  make -f 'Makefiles/Makefile.SDL.UNIX.GCC'
}

package() {
  cd "$srcdir/Supermodel_${pkgver}_Src"

  install -Dm755 "$srcdir/supermodel.sh" "$pkgdir/usr/bin/supermodel"

  install -Dm755 "bin/Supermodel" "$pkgdir/usr/share/supermodel/Supermodel"

  install -Dm644 "Docs/LICENSE.txt" "$pkgdir/usr/share/licenses/supermodel/LICENSE"
  install -Dm644 "Docs/README.txt" "$pkgdir/usr/share/doc/supermodel/README"

  install -d "$pkgdir/usr/share/supermodel/Config"
  install -m644 Config/* "$pkgdir/usr/share/supermodel/Config/"
}
