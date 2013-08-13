# Maintainer: Evan Teitelman <teitelmanevan@gmail.com>
# Contributor: Silvernode <hookahkitty@gmail.com>

pkgname=im-bin
pkgver=3.8.1
pkgrel=2
pkgdesc="Toolkit for Digital Imaging"
arch=('x86_64')
url="http://www.tecgraf.puc-rio.br/iup/"
license=('custom:tecgraf_library')
depends=('gtk2' 'lua51')
optdepends=('lua51: bindings for Lua are available'
            'cd-bin: for additional controls support'
            'iup-bin: for advanced imaging support'
            'mesa: for OpenGL support')
source=("http://superb-dca3.dl.sourceforge.net/project/imtoolkit/${pkgver}/Linux%20Libraries/im-${pkgver}_Linux32_64_lib.tar.gz")
md5sums=('d28c103aa52c3be3d780da7a1c697ef2')

prepare() {
  cd "$srcdir"

  sed -i "s|/usr|$pkgdir/usr|" tec_uname
}

package() {
  cd "$srcdir"

  # Base directories.
  install -dm755 "$pkgdir/usr/lib"
  install -dm755 "$pkgdir/usr/include"

  ./install <<< $'\n' > /dev/null
  ./install_dev <<< $'\n' > /dev/null
  ./config_lua_module <<< $'\n' > /dev/null
}
