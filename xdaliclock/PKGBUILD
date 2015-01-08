# Contributor: DonVla <donvla@users.sourceforge.net>

pkgname=xdaliclock
pkgver=2.41
pkgrel=1
pkgdesc="An advanced xclock substitute"
arch=(i686 x86_64)
url="http://www.jwz.org/xdaliclock/"
license="X11R5"
depends=('libxext' 'libxt')
source=(http://www.jwz.org/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('516de1f8f8546e00a674a510c3aa1698')
sha256sums=('2d347347b7add0a7d535f5c59e811d495f5451b18fef54f1cc5124a3fe9633b3')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/X11"

  ./configure --prefix=/usr
  make
}                                                                                                                                                                                                                                                                                                                          

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/X11"

  install -D -m 0755 xdaliclock ${pkgdir}/usr/bin/xdaliclock
  install -D -m 0644 xdaliclock.man  ${pkgdir}/usr/share/man/man1/xdaliclock.1
} 
