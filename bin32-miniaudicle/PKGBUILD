# Maintainer: SpepS <dreamspepser at yahoo dot it>

_pkgname32=miniaudicle
pkgname=bin32-$_pkgname32
pkgver=0.2.0
pkgrel=2
pkgdesc="A light-weight integrated development environment for the ChucK digital audio programming language. Multilib."
arch=('x86_64')
url="http://audicle.cs.princeton.edu/mini/"
license=('GPL')
depends=('lib32-libsndfile' 'lib32-wxgtk')
makedepends=('gcc-multilib')
provides=("$_pkgname32")
conflicts=("$_pkgname32")
source=("http://${_pkgname32}.googlecode.com/files/miniAudicle-${pkgver}.tgz")
md5sums=('37389af75bd98de127c71e08d47d43c7')

build() {
  cd "${srcdir}/miniAudicle-${pkgver}"

  unset CFLAGS
  _WXCONFIG="/usr/lib32/wx/config/gtk2-unicode-release-2.8"

  sed "s|?||g;s|g[c+][c+]|& -m32|;s|wx-config|$_WXCONFIG|g" \
	-i makefile.alsa \
	-i chuck/src/makefile.alsa

  make -f makefile.alsa
}

package() {
  cd "${srcdir}/miniAudicle-${pkgver}/wxw"

  install -Dm755 miniAudicle "$pkgdir/usr/bin/miniaudicle"
}