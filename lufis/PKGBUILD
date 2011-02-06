# $Id:$
# Contributor:
# Maintainer: Laszlo Papp <djszapi2@gmail.com>
pkgname=lufis
pkgver=0.3
pkgrel=1
pkgdesc="Hybrid userspace filesystem framework supporting many exotic filesystems"
arch=(i686 x86_64)
url="http://sourceforge.net/projects/fuse/"
license=('custom')
depends=('lufs')
source=(http://downloads.sourceforge.net/sourceforge/fuse/lufis-0.3.tar.gz)
md5sums=('fd3e4eebf3967b75157bc42418326d03')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}/
  make || return 1
  install -Dm755 ${srcdir}/${pkgname}-${pkgver}/${pkgname} ${pkgdir}/usr/bin/${pkgname}
}

