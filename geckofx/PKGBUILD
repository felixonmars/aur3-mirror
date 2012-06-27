pkgname=geckofx
pkgver=13.0_0.1
pkgrel=1
pkgdesc="GeckoFX is a cross platform Webrowser control for embedding into WinForms Applications."
url="https://bitbucket.org/geckofx/geckofx-13.0"
arch=(any)
license=("MPL 1.1")
depends=(gtk-sharp-2 mono)
makedepends=(mono)
options=(!strip)
source=("https://bitbucket.org/geckofx/geckofx-13.0/get/be49928a337d.tar.bz2")
md5sums=('2494f5e68cae3d390440196b6ee91ca1')

build() {
  cd "$srcdir/geckofx-geckofx-13.0-be49928a337d/Skybound.Gecko"
  xbuild Skybound.Gecko.sln
}

package() {
  cd "$srcdir/geckofx-geckofx-13.0-be49928a337d/Skybound.Gecko/bin/x86/Debug_Linux"
  install -Dm644 geckofx-13.dll "$pkgdir/usr/lib/GeckoFX/geckofx-13.dll"
  install -Dm644 geckofx-13.dll.config "$pkgdir/usr/lib/GeckoFX/geckofx-13.dll.config"
  gacutil -i geckofx-13.dll -root "$pkgdir/usr/lib"
}
