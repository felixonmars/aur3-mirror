# Maintainer: Bartek Piotrowski <barthalion@gmail.com>
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Contributor: Mauricio Barrera <damage@damage.zero.org>

pkgname=colortail
pkgver=0.3.3
pkgrel=1
pkgdesc="Log colorizer to make log checking easier"
arch=('i686' 'x86_64')
license=('GPL')
url="http://joakimandersson.se/projects/colortail/"
depends=('gcc-libs>=4.4.1')
backup=('etc/colortail/conf.daemon'
        'etc/colortail/conf.kernel'
        'etc/colortail/conf.messages'
        'etc/colortail/conf.secure'
        'etc/colortail/conf.xferlog')
source=(http://joakimandersson.se/files/${pkgname}-${pkgver}.tar.gz)
md5sums=('a6fc24230c0a2c7cd0313cd3b73f4a64')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}/" install
  install -D -m644 example-conf/conf.daemon "${pkgdir}/etc/colortail/conf.daemon"
  install -D -m644 example-conf/conf.kernel "${pkgdir}/etc/colortail/conf.kernel"
  install -D -m644 example-conf/conf.messages "${pkgdir}/etc/colortail/conf.messages"
  install -D -m644 example-conf/conf.secure "${pkgdir}/etc/colortail/conf.secure"
  install -D -m644 example-conf/conf.xferlog "${pkgdir}/etc/colortail/conf.xferlog"
}
