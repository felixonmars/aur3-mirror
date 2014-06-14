# Maintainer: thiagoc <root@thiagoc.net>
# https://github.com/thiagoc/aur-packages

pkgname=hiphopapp-bin
pkgver=0.4.6
pkgrel=4
pkgdesc='An application that lets you listen to songs instantly'
arch=('i686' 'x86_64')
url='http://gethiphop.net'
license=('MIT')
optdepends=('libudev.so.0: install it if HipHop does not run correctly')
conflicts=('hiphopapp')
options=('!strip')
_pkgarch='32'
_md5sum='aa2c4db36e459e3dbf942c705e94e336'
if [ "${CARCH}" == 'x86_64' ]; then
  _pkgarch='64'
  _md5sum='087d9d2525814006373d95a8675beaa4'
fi
source=(http://thiagoc.net/${CARCH}/HipHop-${pkgver}.tgz
        'hiphopapp.desktop'
        'hiphopapp.install'
        'icon.png')
md5sums=($_md5sum
         'd2ef8a6c78c19fd12cd3ecdddbfce47a'
         '972d90bfe5b2a309f6b9023f75fcf1a6'
         '76a02d78bf606f01cbad8d680f57ab8e')

package() {
  cd ${srcdir}
  install -dm 755 ${pkgdir}/opt/${pkgname}
  install -dm 755 ${pkgdir}/usr/bin
  install -Dm 755 HipHop/HipHop ${pkgdir}/opt/${pkgname}
  install -Dm 644 HipHop/libffmpegsumo.so ${pkgdir}/opt/${pkgname}
  install -Dm 644 HipHop/nw.pak ${pkgdir}/opt/${pkgname}
  install -Dm 644 hiphopapp.desktop ${pkgdir}/usr/share/applications/hiphopapp.desktop
  install -Dm 644 icon.png ${pkgdir}/usr/share/pixmaps/hiphopapp.png
  ln -s /opt/${pkgname}/HipHop ${pkgdir}/usr/bin
}

# vim:set ts=2 sw=2 et:
