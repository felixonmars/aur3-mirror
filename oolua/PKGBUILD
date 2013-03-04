# Maintainer: Harley Laue <losinggeneration@gmail.com>
pkgname=oolua
pkgver=1.4.0
pkgrel=1
pkgdesc="A C++ binding for Lua, which is intended to ease the embedding of Lua in C++ allowing easy access to tables, functions to be called and types to be pushed and pulled from the stack; also C++ in Lua by binding functions, types and class hierarchies."
arch=(i686 x86_64)
url="http://code.google.com/p/oolua/"
license=('MIT')
depends=(gcc-libs lua51)
makedepends=(gmock premake4 tar)
source=(http://oolua.googlecode.com/files/$pkgname-release-$pkgver.tar.gz
        lua51.patch)
md5sums=('d127ada675a13fd1c1a0b489249b8337'
         '65245c0e470bbcfe080938b4df39e594')

build() {
  cd "$srcdir/$pkgname-release-$pkgver"

  patch -p1 < ../lua51.patch

  premake4 gmake

  # We only really want the library and file generator
  make config=release oolua file_generator
}

package() {
  cd "$srcdir/$pkgname-release-$pkgver"

  # install by hand creating the directories we need since there is no
  # make install
  mkdir -p $pkgdir/usr/{bin,lib,include/oolua,share/licenses/$pkgname}
  cp bin/Release/file_generator $pkgdir/usr/bin/${pkgname}_file_generator
  cp bin/Release/liboolua.a $pkgdir/usr/lib
  cp include/*.h $pkgdir/usr/include/oolua
  cp licence.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
