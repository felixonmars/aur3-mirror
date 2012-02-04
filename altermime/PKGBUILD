pkgname=altermime
pkgver=0.3.10
pkgrel=1
pkgdesc="A small program which is used to alter your mime-encoded mailpacks"
url="http://www.pldaniels.com/altermime/"
arch=("i686" "x86_64")
license=('BSD')
source=(http://www.pldaniels.com/altermime/${pkgname}-${pkgver}.tar.gz \
        altermime.patch)
md5sums=('aaf0ad8029958a2dc6da3abb4dc178c2'
         'fb321efaf53b7caa13d8ad62ca85efac')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 < ${srcdir}/altermime.patch
  make
  install -m755 altermime -D "${pkgdir}/usr/bin/altermime"
}
