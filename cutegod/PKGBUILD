# Maintainer: Jarosla Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: rabyte <rabyte*gmail>

pkgname=cutegod
pkgver=0.3.0
pkgrel=5
pkgdesc="Take on the role of a god and satisfy the needs of your believers"
arch=('i686' 'x86_64')
url="http://mfgames.com/cutegod/start"
license=('GPL2')
depends=('mono' 'devil' 'sdl_mixer' 'sdl_net' 'sdl_image' 'sdl_ttf' 'sdl_gfx' 'smpeg' 'freeglut' 'physfs' 'perl')
makedepends=('nant' 'patch')
source=(http://mfgames.com/releases/$pkgname/$pkgname-$pkgver.tar.bz2 \
        http://mfgames.com/releases/$pkgname/$pkgname-data-$pkgver.zip \
        libs-filenames.diff \
        $pkgname-gamedir.diff)
md5sums=('126e0612af692ae4bee41a261eeae4b4'
         '73fc19011fa80887752d819309009bd5'
         '9fe6d977ed2d06ac236b2720e5f93696'
         '9639c49a578220166dac592ea55ed80c')

build() {
  cd $pkgname-$pkgver

  patch -Np1 -i ../$pkgname-gamedir.diff
  patch -Np1 -i ../libs-filenames.diff

  sed -e 's|fnant|nant|g' \
      -e 's|build-debug|build|g' \
      -i Makefile

  export MONO_SHARED_DIR=$(pwd)
  cp -rf ../Assets/ .
  make
}

package() {
  cd $pkgname-$pkgver

  install -D -m755 tools/$pkgname ${pkgdir}/usr/bin/$pkgname
  install -d ${pkgdir}/usr/share/$pkgname
  cp -rf Assets/ CuteGod/bin/Release/* $pkgdir/usr/share/$pkgname/

# i don't want executable exe files on my linux box
  chmod 644 ${pkgdir}/usr/share/$pkgname/CuteGod.exe
}
