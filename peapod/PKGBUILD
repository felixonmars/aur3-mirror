# Contributor: timetrap : timetrap AT gmail DOT com
# Maintainer: Erik Johnson (palehose at gmail dot com)
pkgname=peapod
pkgver=0.7.2
pkgrel=3
pkgdesc="A commandline podcatcher that works."
arch=('any')
url="http://www.peapodpy.org.uk"
license=('GPL')
depends=('python2' 'urlgrabber' 'python-eyed3')
optdepends=('libgpod: For ipod support')
source=(http://www.peapodpy.org.uk/downloads/peapod-$pkgver.tar.gz setup.py python.patch)
md5sums=('2566cf8eed7a57e13aafc6ae6763c7bb'
         'f136b2fdecbb004cf5fafebdb451c8ae'
         'b31c8ce1b658a077ba6e81a8ba1185ea')

build() {

  cp "${srcdir}/setup.py" "${srcdir}/${pkgname}-${pkgver}/"

  cd "${srcdir}"
  patch -Np0 -i "${srcdir}/python.patch"

  cd "${srcdir}/${pkgname}-${pkgver}/"
  python2 setup.py install --root=${pkgdir}

}

# vim:set ts=2 sw=2 et:
