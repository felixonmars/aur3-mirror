# Maintainer: Anton Larionov <diffident dot cat at gmail dot com>

pkgname=ideas
pkgver=1.0.3.9
_pkgver=1039
pkgrel=1
pkgdesc="Nintendo DS emulator"
arch=('i686' 'x86_64')
url="http://ciacin.site90.com/ideas.php"
license=('custom:freeware')

if [ "$CARCH" == "i686" ]; then
  depends=('libgl' 'gtk2')
else
  depends=('lib32-libgl' 'lib32-gtk2')
fi

#source=(http://ciacin.site90.com/ajx/resolve_link.php?link=${pkgname}${_pkgver}.tar.bz2)
source=("http://content.wuala.com/contents/diffycat/public/aur/source/${pkgname}/${pkgname}${_pkgver}.tar.bz2")
md5sums=('c8225a380e0cf9a94aa97f6c8150ba85')

package() {
  cd "$srcdir"

  install -D -m755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -D -m644 'readme.txt' "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim:set ts=2 sw=2 et:
