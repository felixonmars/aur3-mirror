# Contributor: Joeny Ang <ang(dot)joeny(at)gmail(dot)com>
# Contributor: Valentin Huélamo <vhuelamo(at)gmail(dot)com>

pkgname=memaker
pkgver=1.5
pkgrel=6
pkgdesc="An application to create avatars from themed packages"
arch=('i686' 'x86_64')
url="http://memaker.org/"
license=('GPL')
depends=('python2-notify' 'python2-xdg' 'python2-numpy' 'gnome-python-desktop')
optdepends=('python2-imaging: for better thumbnails')
source=(http://launchpad.net/memaker/trunk/${pkgver}/+download/${pkgname}-${pkgver}.tar.gz
        ${pkgname}.desktop
        ${pkgname}.ui.diff)
md5sums=('08f201fee5670c9f10280978f37fe142'
         '5dc68da77b17a74b80914b3d948df41f'
         '71973a63bb7d582261d4d0030635945d')

_sitepackages=`python2 -c "from distutils.sysconfig import get_python_lib; print get_python_lib()"`

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # apply UI patch from https://bugs.launchpad.net/memaker/+bug/423492/comments/8
  patch -Np0 -i ../${pkgname}.ui.diff
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Copy source files
  mkdir -p ${pkgdir}${_sitepackages}/${pkgname}
  cp -r . ${pkgdir}${_sitepackages}/${pkgname}

  # Create shell script
  mkdir ${pkgdir}/usr/bin
  echo "#!/bin/sh
python2 "${_sitepackages}"/"${pkgname}/${pkgname} > ${pkgdir}/usr/bin/${pkgname}
  chmod a+x ${pkgdir}/usr/bin/${pkgname}

  # Desktop file and icon
  install -D -m644 ${srcdir}/${pkgname}-${pkgver}/data/logo.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png
  install -D -m644 ${startdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
