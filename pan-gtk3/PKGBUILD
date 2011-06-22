# Maintainer: Hervé Cauwelier (herve) <herve ¤ oursours ¤ net>

pkgname=pan-gtk3
_realname=pan
pkgver=0.135
pkgrel=4
pkgdesc="A powerful Newsgroup Article reader based on GTK3"
arch=('i686' 'x86_64')
url="http://pan.rebelbase.com/"
license=('GPL2')
depends=('gtkspell' 'pcre' 'gmime')
makedepends=('intltool')
conflicts=('pan-devel' 'pan' 'pan-git')
replaces=('pan-devel' 'pan' 'pan-git')
options=('!makeflags')
source=(http://pan.rebelbase.com/download/releases/${pkgver}/source/${_realname}-${pkgver}.tar.bz2)
sha1sums=('6cd93facf86615761279113badd7462e59399ae4')

build() {
  cd "${srcdir}/${_realname}-${pkgver}"
  ./configure --prefix=/usr --with-gtk3
  make
}

package() {
  cd "${srcdir}/${_realname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
