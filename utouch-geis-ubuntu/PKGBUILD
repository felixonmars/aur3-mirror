pkgname=utouch-geis-ubuntu
pkgver=2.1.2
_ubuntu_ver=0ubuntu3
pkgrel=1
pkgdesc="Implementation of the GEIS (Gesture Engine Interface and Support) interface."
arch=('i686' 'x86_64')
url="https://launchpad.net/utouch-geis"
license=('GPL' 'LGPL')
depends=('utouch-grail')
makedepends=('xorg-server-ubuntu')
provides=('utouch-geis')
conflicts=('utouch-geis')
source=(http://launchpad.net/${pkgname%-*}/trunk/${pkgver}/+download/${pkgname%-*}-${pkgver}.tar.gz
        http://archive.ubuntu.com/ubuntu/pool/main/u/utouch-geis/utouch-geis_${pkgver}-${_ubuntu_ver}.debian.tar.gz)

sha512sums=('a9525ab53acea0e37d797aacd78f7ef052009129a50a336a315c606c0d64103638a7d3899980f4f8dd01a171b26f25c19fb736c4b2845dea0dda0c058f903635'
            '6e95d4f81124c6fc2c897859943b23fab7f425acc3ef64f6af8c0051048be53928642b5a12cde08432b51eae87591248202ad9aee1114960e209590adc825170')

build() {
  cd "${srcdir}/${pkgname%-*}-${pkgver}"

  for i in $(cat "${srcdir}/debian/patches/series" | grep -Ev '#'); do
    patch -Np1 -i "${srcdir}/debian/patches/${i}"
  done

  PYTHON2VER=$(ls -l /usr/bin/python2 2>&1 | sed 's/^.*\(.\..\)/\1/g')
  sed -i "/python >= ${PYTHON2VER}/s/python \(>= .\..\)/python-${PYTHON2VER} \1/g" configure
  PYTHON=/usr/bin/python2 ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname%-*}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  sed -i 's|\(#!.*bin.*python$\)|\12|g' "${pkgdir}"/usr/bin/{geisview,pygeis}
}

