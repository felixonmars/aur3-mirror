# Maintainer: <kaptoxic _at_ yahoo _dot_ com >
# Contributor: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Original: Paolo Fagni <paolo.fagni@gmail.com>

_name1_=xorg
_name2_=edit
pkgname=${_name1_}-${_name2_}
pkgver=08.08.06
pkgrel=2
pkgdesc="A GUI editor for the X.Org configuration file"
arch=("i686" "x86_64")
url="http://www.deesaster.org/progxorg.php"
license=("GPL3")
depends=("wxgtk")
options=(!emptydirs)
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}_src.tar.bz2 compatibility.patch ${pkgname}.desktop)
md5sums=('ab0bee4ecdc3db19f7bf357499bdaa7a' '443c403b3bdf0421582a0a430ab7cc85' 'e9e3e1d8b55794a36fbba3a98a762704')

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}

  patch -p0 < "${srcdir}"/compatibility.patch
  
  make
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  make INSTALLPATH="${pkgdir}"/usr install

  # Directories
  install -d "${pkgdir}"/usr/bin/

  # Binaries
  ln -s /usr/lib/${_name1_}${_name2_}/${pkgname} "${pkgdir}"/usr/bin/

  # Desktop
  install -D "${srcdir}"/${pkgname}.desktop "${pkgdir}"/usr/share/applications/${pkgname}.desktop
}
