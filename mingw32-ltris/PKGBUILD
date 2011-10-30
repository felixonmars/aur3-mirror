# Maintainer: Jonathan Liu <net147@gmail.com>
pkgname=mingw32-ltris
_realpkgname=ltris
pkgver=1.0.18
pkgrel=1
pkgdesc="A tetris clone where you have a bowl with blocks falling down."
arch=('any')
url="http://lgames.sourceforge.net/index.php?project=LTris"
license=('GPL')
depends=('mingw32-gettext' 'mingw32-libpng' 'mingw32-sdl_mixer')
source=("http://downloads.sourceforge.net/lgames/${_realpkgname}-${pkgver}.tar.gz")
md5sums=('533be97db3f6589e879b905c66a44300')

build() {
  cd "${srcdir}/${_realpkgname}-${pkgver/_/-}"
  unset LDFLAGS
  LIBS='-lintl' ./configure --host=i486-mingw32 --prefix=/usr/i486-mingw32 --disable-install
  make
}

package() {
  cd "${srcdir}/${_realpkgname}-${pkgver/_/-}"
  install -D -m644 src/ltris.exe "${pkgdir}/usr/lib/i486-mingw32/opt/${_realpkgname}/ltris.exe"
  install -d -m755 "${pkgdir}/usr/lib/i486-mingw32/opt/${_realpkgname}"/{gfx,sounds}
  cp -r src/{gfx,sounds} "${pkgdir}/usr/lib/i486-mingw32/opt/${_realpkgname}/"
  find "${pkgdir}" -type f -name 'Makefile*' -delete
}
