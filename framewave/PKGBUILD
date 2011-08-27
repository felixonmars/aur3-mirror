# Maintainer: Bernd Amend <berndamend web de>

pkgname=framewave
pkgver=1.3.1
pkgrel=2
pkgdesc="Free and open-source collection of popular image and signal processing routines designed to accelerate application development."
arch=('i686' 'x86_64')
url="http://developer.amd.com/cpu/libraries/framewave"
license=('APACHE')

if [ "${CARCH}" = "i686" ] ; then
  _name="FW_${pkgver}_Lin32"
elif [ "${CARCH}" = "x86_64" ] ; then
  _name="FW_${pkgver}_Lin64"
fi

source=("http://downloads.sourceforge.net/sourceforge/framewave/${_name}.tar.gz")

[ ${CARCH} == "i686" ] && md5sums=('faf8a87aaad30ce2bf85cd88bc301414')
[ ${CARCH} == "x86_64" ] && md5sums=('b6ccd9b13c7c9e4b4c5226ab42050bac')

build() {
  cd "${srcdir}/${_name}"
  install -d -m755 "${pkgdir}/usr/include" || return 1
  install -d -m755 "${pkgdir}/usr/lib" || return 1

  install -m755 lib/libfw* "${pkgdir}/usr/lib/" || return 1
  install -m644 fw*.h "${pkgdir}/usr/include/" || return 1

  cd ${pkgdir}/usr/lib
  ln -s libfwVideo.so.${pkgver} libfwVideo.so
  ln -s libfwJPEG.so.${pkgver} libfwJPEG.so
  ln -s libfwSignal.so.${pkgver} libfwSignal.so
  ln -s libfwImage.so.${pkgver} libfwImage.so
  ln -s libfwBase.so.${pkgver} libfwBase.so
}
