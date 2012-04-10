#Maintainer: Andrzej Giniewicz <gginiu@gmail.com>

pkgname=serna
pkgver=4.4.0
_filever=4.4
_pkgdate=20111103
pkgrel=3
pkgdesc="Free Open Source XML Editor"
license=('GPL')
url="http://www.syntext.com/products/serna-free/"
source=("http://downloads.syntext.com/serna-free/${pkgver}-RELEASE/serna-free-${pkgver}-${_pkgdate}-linux.tgz"
        serna.sh)
arch=('i686' 'x86_64')
[ "$CARCH" = "i686"   ] && depends=('gcc-libs' 'libxmu' 'libxft' 'libxinerama')
[ "$CARCH" = "x86_64" ] && depends=('gcc-libs-multilib' 'lib32-libxmu' 'lib32-libxft' 'lib32-libxinerama')
makedepends=('binutils' 'tar' 'gzip' 'sed')
md5sums=('68422e66f4d1b0cf75a8bba6738966d5'
         '324816ab1d649be335810eab5150a356')

build() {
  cd "${srcdir}"/serna-free-${_filever}
  mkdir -p "${pkgdir}"/opt
  mkdir -p "${pkgdir}"/usr/bin
  tar -xzf serna-free-${_filever}.tgz -C "${pkgdir}"/opt
  sed -e "s/pkgver/${_filever}/g" ../serna.sh > "${pkgdir}"/opt/serna-free-${_filever}/bin/serna.sh
  chmod 755 "${pkgdir}"/opt/serna-free-${_filever}/bin/serna.sh
  chmod 775 "${pkgdir}"/opt/serna-free-${_filever}/bin/serna.bin
  chmod 755 "${pkgdir}"/opt/serna-free-${_filever}/utils/publishing/*.sh
  chmod -R a+r "${pkgdir}"/opt/serna-free-${_filever}
  chmod a+x `find "${pkgdir}"/opt/serna-free-${_filever} -type d`
  ln -sf /opt/serna-free-${_filever}/bin/serna.sh "${pkgdir}"/usr/bin/serna
  chown -R root:root "${pkgdir}"
}

