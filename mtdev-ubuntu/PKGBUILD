pkgname=mtdev-ubuntu
pkgver=1.1.0
_ubuntu_ver=2ubuntu1
pkgrel=1
pkgdesc="A stand-alone library which transforms all variants of kernel MT events to the slotted type B protocol"
arch=(i686 x86_64)
url="http://bitmath.org/code/mtdev/"
license=('GPL')
depends=('glibc')
provides=('mtdev')
conflicts=('mtdev')
options=('!libtool')
source=("${url}${pkgname%-*}-${pkgver}.tar.bz2"
        "http://archive.ubuntu.com/ubuntu/pool/main/m/mtdev/mtdev_${pkgver}-${_ubuntu_ver}.debian.tar.gz")
sha512sums=('e46c1cdd0543544fd75b0cf7a474ecc06716c5c0f6021027664d7de7343b0bde987358be3744bfe1e95154b4e2b96471277d153e6655a81d2658579d783fae38'
            '239a275c8756bb7c5fd68f0dddc13e27280e1446059987943a16389f96b6dbc34083714cc92ed31fe49726f3d73ac513eadf0f29abf6b29b447006e64395b9c3')

build() {
  cd "${srcdir}/${pkgname%-*}-${pkgver}"

  for i in $(cat "${srcdir}/debian/patches/series" | grep -Ev '#'); do
    patch -Np1 -i "${srcdir}/debian/patches/${i}"
  done

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname%-*}-${pkgver}"

  make DESTDIR="${pkgdir}/" install
}

# vim:set ts=2 sw=2 et:
