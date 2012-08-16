#Maintainer: trett <roman@trett.ru>
pkgname=stopix
pkgver=1.3
pkgrel=1
pkgdesc="The simple screenshot with upload to image hosting based on Qt."
url="https://github.com/trett/stopix"
arch=('i686' 'x86_64')
license=('GPLv3')
depends=(qt)
optdepends=()
makedepends=('git' 'qconf')
conflicts=()
install=stopix.install
md5sums=('35a23331dc221b36da54a64d0be22e99')
 
build() {
  msg "Connecting to GIT server..."
  if [ -d ${srcdir}/${pkgname} ] ; then
  cd "${srcdir}/${pkgname}" && make clean && git pull origin master
  msg "The local files are updated."
  make
  else
  git clone git://github.com/trett/stopix.git  --depth=1
  cp -r "${srcdir}/${pkgname}/${pkgname}" "${srcdir}"
  fi
  msg "GIT checkout done or server timeout"
  cd "${srcdir}/${pkgname}"
  qmake -makefile -unix -o Makefile "DESTDIR=$startdir/pkg/usr/bin/" stopix.pro
  make
}
 
package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}" install

  for res in 24 32 36 40 48 128; do
    install -D -m644 "${srcdir}/${pkgname}/${pkgname}/icons/${res}x${res}/stopix.png" \
    "${pkgdir}/usr/share/icons/hicolor/${res}x${res}/apps/stopix.png"
  done
    install -D -m644 "${srcdir}/${pkgname}/$pkgname/stopix.desktop" \
    "${pkgdir}/usr/share/applications/stopix.desktop"
    rm -rf "${srcdir}/${pkgname}/${pkgname}"
}
 
# vim:set ts=2 sw=2 et:
