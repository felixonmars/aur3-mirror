# Maintainer: Borja Ruiz <borja [at] libcrack [dot] so>
_pkgname=binjitsu
pkgname=python2-${_pkgname}-git
pkgver=2.2.r134
pkgrel=2
pkgdesc="CTF framework and exploit development library."
arch=('any')
url="https://binjitsu.readthedocs.org"
license=('MIT' 'GPL2' 'BSD')
makedepends=('lib32-glibc')
depends=('python2>=2.7' 'python2-mako' 'python2-paramiko'
         'python2-argparse' 'python2-pyelftools'
         'python2-pyserial' 'python2-capstone') # required by pwntools
provides=('python2-binjitsu')
conflicts=('python2-pwntools')
replaces=('python2-pwntools')
options=(!emptydirs)
source=("${pkgname}"::'git+https://github.com/binjitsu/binjitsu.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g' | cut -f1-3 -d.
}

build() {
  cd "${srcdir}/${pkgname}"
  sed -e 's/capstone==2.1/capstone/g' -i setup.py
  python2 setup.py build
}

package() {
  cd "${srcdir}/${pkgname}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m 644 LICENSE-pwntools.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.pwntools"
  install -D -m 644 LICENSE-binjitsu.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.binjitsu"

  #echo "export PATH=\"`realpath bin`:\$PATH\"" >> ${pkgdir}/etc/profile.d/binjitsu.sh
  #echo "export PYTHONPATH=\"`realpath .`:\$PYTHONPATH\""  >> ${pkgdir}/etc/profile.d/binjitsu.sh
  # cp binjitsu.profile ${pkgdir}/etc/profile.d/binjitsu.sh
}
# vim:set ts=2 sw=2 et:
