# Maintainer : Cedric Mathieu <me.xenom[at]gmail.com>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=gambatte
pkgver=0.5.0
pkgrel=3
pkgdesc="An accuracy-focused Game Boy Color emulator"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/$pkgname/"
license=('GPL')
depends=('gcc-libs' 'sdl' 'zlib')
optdepends=('gambatte-qt: Qt4 frontend')
makedepends=('scons')
source=(http://downloads.sourceforge.net/$pkgname/${pkgname}_src-$pkgver-wip2v2.tar.gz \
	$pkgname.desktop)
 
md5sums=('5f5c4e1fd6bf70c75a34ed6c9e39c95d'
	 '0c3a3f1ca7a24758febb7f7344157edd')

build() {
  cd ${pkgname}_src-$pkgver-wip2v2

  for i in libgambatte gambatte_sdl; do
	cd $i
	scons CXXFLAGS="${CXXFLAGS}" || return 1
	cd ..
  done
  
  install -Dm755 gambatte_sdl/gambatte_sdl "$pkgdir"/usr/bin/$pkgname
  install -Dm644 libgambatte/libgambatte.a "$pkgdir"/usr/lib/libgambatte.a 
  install -Dm644 gambatte_sdl/man/gambatte_sdl.6 "$pkgdir"/usr/share/man/man6/$pkgname.6
}

