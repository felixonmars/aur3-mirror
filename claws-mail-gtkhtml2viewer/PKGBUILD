# Contributor: lchr (lchr@spellcraft.dk)

pkgname=claws-mail-gtkhtml2viewer
pkgver=0.30
pkgrel=2
pkgdesc="HTML renderer plugin for Claws Mail."
arch=('i686' 'x86_64')
url="http://www.claws-mail.org/plugin.php?plugin=gtkhtml2"
license=('GPL3')
depends=('claws-mail' 'libgtkhtml')
makedepends=('gcc' 'claws-mail')
source=(http://www.claws-mail.org/downloads/plugins/gtkhtml2_viewer-$pkgver.tar.gz)
md5sums=('90492a1577cbc02d0c2fd370afb2b5c0')

build() {
  cd "${srcdir}/gtkhtml2_viewer-${pkgver}"

  ./configure
  make || return 1
  make DESTDIR="$pkgdir" install
}
