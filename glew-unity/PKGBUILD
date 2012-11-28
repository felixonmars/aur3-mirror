# Maintainer: ttyso4 <ttyso4@googlemail.com>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>

pkgname=glew-unity
pkgver=1.9.0
pkgrel=1
pkgdesc="The OpenGL Extension Wrangler Library patched for nux package from Ayatana"
arch=('i686' 'x86_64')
url="http://glew.sourceforge.net"
license=('BSD' 'MIT' 'GPL')
depends=('libxmu' 'libxi' 'glu')
provides=('glew')
conflicts=('glew')
source=(http://downloads.sourceforge.net/glew/glew-${pkgver}.tgz 'https://bazaar.launchpad.net/~ubuntu-branches/ubuntu/raring/glew/raring/download/head:/git_glxew_export_fix-20120808174636-99l0z5apcpkqp8jc-5/git_glxew_export_fix.patch')
sha1sums=('9291f5c5afefd482c7f3e91ffb3cd4716c6c9ffe'
          'eaa706d2c8cd61dbabf13519b8a538d9ad8a3f91')

build() {
  cd "${srcdir}/glew-${pkgver}"
  patch -p1 -i $srcdir/git_glxew_export_fix.patch
  sed -i 's|lib64|lib|' config/Makefile.linux
  make
}

package() {
  cd "${srcdir}/glew-${pkgver}"
  make GLEW_DEST="${pkgdir}/usr" install.all
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/glew/LICENSE"

  rm "${pkgdir}"/usr/lib/{libGLEW,libGLEWmx}.a
  chmod 0755 "${pkgdir}"/usr/lib/libGLEW*.so.${pkgver}
}
