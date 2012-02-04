#Maintainer: kfgz <kfgz at interia pl>
pkgname=c-ray
pkgver=1.1
pkgrel=1
pkgdesc="A simple raytracer and CPU benchmark"
url="http://www.futuretech.blinkenlights.nl/c-ray.html"
license=('custom')
arch=(i686 x86_64)
source=(http://www.futuretech.blinkenlights.nl/depot/${pkgname}-${pkgver}.tar.gz \
        c-ray-run \
        c-ray-run-full)
md5sums=('5b0b939c953dc7f7eb03fae2c1526d33' \
         '4fef5fdb248f1111820068b54612c49a' \
         'e44f75079cebbc1265a910f7b1e567b5')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  gcc -O2 -o c-ray-f c-ray-f.c -lm -pipe -march=native
  gcc -O2 -o c-ray-mt c-ray-mt.c -lpthread -lm -pipe -march=native
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  install -dm755 ${pkgdir}/usr/{bin,share/doc/c-ray,share/c-ray}
  install -m644 README ${pkgdir}/usr/share/doc/c-ray
  install -m644 sphfract ${pkgdir}/usr/share/c-ray
  install -m644 scene ${pkgdir}/usr/share/c-ray
  install -m755 c-ray-f ${pkgdir}/usr/bin
  install -m755 c-ray-mt ${pkgdir}/usr/bin
  install -m755 ${srcdir}/c-ray-run ${pkgdir}/usr/bin
  install -m755 ${srcdir}/c-ray-run-full ${pkgdir}/usr/bin
}