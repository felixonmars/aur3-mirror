# Maintainer: jhonnnyboy <jhonnyboy@ymail.com>
pkgname=freestroke-bin
_pkgname=FreeStroke
pkgver=0.0.1
pkgrel=1
pkgdesc="a motion-control software. Let you control your computer with gesture. As today the only supported capture device is MS kinect (require a windows computer on your network)"
url="http://www.freestroke.fr/"
arch=('i686 x86_64')
license=('GPLv3')
if test "$CARCH" == x86_64; then
    depends=('lib32-qt4' 'lib32-sqlite' 'lib32-glu' 'lib32-mesa-libgl' )
  else
    depends=('sqlite' 'glu' 'qt4' 'mesa-libgl')
  fi
makedepends=('sed')
conflicts=()
replaces=()
backup=()
#install='foo.install'
source=("${url}/downloads/${_pkgname}/linux/1000/${_pkgname}-${pkgver}-linux.tar.gz")
md5sums=('5ea9e92531ec7d52cdedbf75e0da86fb')

 build() {
      tar -xvzf ${_pkgname}-${pkgver}-linux.tar.gz
     	cd "${_pkgname}-${pkgver}-linux"
      tar -xvzf ${_pkgname}.tar.gz
      sed -i -e "s|Exec=/opt/FreeSoft/FreeStroke|Exec=/usr/bin/FreeStroke|g" ${_pkgname}.desktop
      sed -i -e "s|Icon=/opt/FreeSoft/FreeStroke-icon|Icon=FreeStroke.png|g" ${_pkgname}.desktop
    }

    package() {
      cd ${srcdir}/${_pkgname}-${pkgver}-linux
      mkdir -p ${pkgdir}/usr/bin
      mkdir -p ${pkgdir}/usr/share/applications/
      mkdir -p ${pkgdir}/usr/share/pixmaps/

      install -m 777 ${_pkgname}-linux  ${pkgdir}/usr/bin/${_pkgname}
      install -m 644 ${_pkgname}.desktop ${pkgdir}/usr/share/applications/
      install -m 644 ${_pkgname}-icon ${pkgdir}/usr/share/pixmaps/${_pkgname}.png
    }

# vim:set ts=2 sw=2 et:
