# Contributor: SaThaRiel <sathariel_dontbugme_74[at]gmail[d0t]com>

pkgname=fayangband
pkgver=1.0.1
pkgrel=1
pkgdesc="FayAngband is an angband variant mainly based on EyAngband"
arch=('i686' 'x86_64')
url="http://www.mikkolehtinen.net/projects.html"
license=('unknown')
depends=('ncurses')
source=(http://www.mikkolehtinen.net/ohjelmat/fayangband-101-src.zip)

md5sums=('51f8c06aea2f2f2c66c9ad5f0d595ca2')

build() {
  cd "${srcdir}/fayangband101/src"

  install -d "${pkgdir}/usr/lib" || return 1
  cp config.h config.h.bak || return 1
  sed -e 's@# define DEFAULT_PATH "./lib/"@# define DEFAULT_PATH "/usr/lib/fayangband/"@' config.h.bak > config.h || return 1

  make -f Makefile.std || return 1
  install -D -m755 "angband" "${pkgdir}/usr/bin/$pkgname" || return 1
  cp -R "${srcdir}/fayangband101/lib" "${pkgdir}/usr/lib/$pkgname" || return 1
  chmod -R 775 "${pkgdir}/usr/lib/$pkgname" || return 1
  chown -R root:users "${pkgdir}/usr/lib/$pkgname" || return 1

  find "${pkgdir}" -iname delete.me -delete || return 1
}
