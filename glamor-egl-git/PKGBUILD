# Maintainer: Damian Nowak <damian.nowak@atlashost.eu>
# Contributor: Eugeni Dodonov <eugeni@dodonov.net>

pkgname='glamor-egl-git'
pkgver='20130924'
pkgrel='1'
pkgdesc='OpenGL based 2D rendering acceleration library	'
arch=('i686' 'x86_64')
url='http://cgit.freedesktop.org/xorg/driver/glamor/'
license=('custom')
depends=('mesa-libgl')
makedepends=('xorg-server-devel' 'git')
replaces=('glamor-git')
provides=('glamor-egl')
conflicts=('glamor-egl' 'glamor-git')
options=('!libtool')
source=('git://git.freedesktop.org/git/xorg/driver/glamor')
sha512sums=('SKIP')

build() {
  cd "${srcdir}/glamor"

  sh autogen.sh --prefix=/usr \
    --disable-static \
    --enable-glx-tls

  make
}

package() {
  cd "${srcdir}/glamor"

  make DESTDIR="${pkgdir}" install

  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
