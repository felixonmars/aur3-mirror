# $Id: PKGBUILD 130072 2011-07-01 21:54:59Z eric $
# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=gweled-sdl_mixer
pkgname2=gweled
pkgver=0.9.1
pkgrel=1
pkgdesc="A puzzle game similar to Bejeweled (aka Diamond Mine)"
arch=('i686' 'x86_64')
license=('GPL')
url="https://launchpad.net/gweled/"
depends=('gtk2' 'librsvg' 'hicolor-icon-theme' 'sdl' 'sdl_mixer')
makedepends=('intltool')
conflicts=('gweled')
install=gweled.install
source=("http://launchpad.net/${pkgname2}/trunk/${pkgver}/+download/${pkgname2}-${pkgver}.tar.gz"
	'gweled_sdlmixer.patch')
md5sums=('746ac14523c968e78140c2f0501fd7cf'
	 'c2120a0dc17de3d52bfd066b91fa2d3e')
sha1sums=('ff4a59935c9e1eb4a202e723baabaab39f526714'
	  '22d9497f4b1db0506ea04883b14363df2b7b0dbd')

build() {
  cd "${srcdir}/${pkgname2}-${pkgver}"
  patch -Np1 -i "${srcdir}/gweled_sdlmixer.patch"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --with-scores-user=root --with-scores-group=games
  make
}

package() {
  cd "${srcdir}/${pkgname2}-${pkgver}"
  make DESTDIR="${pkgdir}" install

# We generate these files on post-install to prevent score resets on upgrade
  rm -rf "${pkgdir}/var"
}
