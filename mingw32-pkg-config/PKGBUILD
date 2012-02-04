# Maintainer: Matěj Týč <bubla@users.sf.net>

pkgname=mingw32-pkg-config
pkgver=1
pkgrel=1
pkgdesc='Support pkg-config script (does not depend on any particular version of pkg-config). Useful for pkg-config powered cross-compiling with mingw32, see http://tinyurl.com/pkg-config-cross for more info'
arch=('any')
url=('http://pkg-config.freedesktop.org/')
license=('zlib')
depends=('pkg-config')
source=('i486-mingw32-pkg-config')
md5sums=('f0fe1e0d28f6342420cd15ef90323f9a')

build(){
  # This indeed has to go to the "normal" directory tree
  install -d ${pkgdir}/usr/bin
  install -m 755 i486-mingw32-pkg-config  ${pkgdir}/usr/bin
  echo "Note that you can use PKG_CONFIG_PATH_CUSTOM to tweak pkg-config path further"
  echo "See the i486-mingw32-pkg-config file itself for more info"
}

