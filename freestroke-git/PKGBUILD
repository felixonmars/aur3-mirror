# Maintainer: jhonnnyboy <jhonnyboy@ymail.com>
pkgbase=freestroke-git
pkgname=freestroke-git
_pkgname=freestroke
pkgver=0.0.0
pkgrel=2
pkgdesc="a motion-control software. Let you control your computer with body-gesture. As today the only supported capture device is MS kinect (require a windows computer on your network)"
url='https://github.com/FreeStroke/FreeStroke.git'
arch=('x86_64')
license=('GPLv3')
depends=('sqlite' 'glu' 'libgl' 'qt5-base' 'qt5-xmlpatterns' 'qt5-multimedia' 'qt5-graphicaleffects' 'qt5-imageformats')
makedepends=('git')
conflicts=()
replaces=()
backup=()
source=('git://github.com/FreeStroke/FreeStroke.git')
md5sums=('SKIP')
pkgver() {
	cd local_repo
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

 build() {
      cd "${_pkgname}/FreeStroke/project/linux/"
      qmake
      make
      mv FreeStroke ../apps/installerLinux/
      cd ../apps/installerLinux/
      sed -i -e "s|Exec=/opt/FreeSoft/FreeStroke|Exec=FreeStroke|g" ${_pkgname}.desktop
      sed -i -e "s|Icon=/opt/FreeSoft/FreeStroke-icon|Icon=FreeStroke.png|g" ${_pkgname}.desktop
    }

    package() {
      cd ${srcdir}/${_pkgname}/FreeStroke/project/apps/installerLinux/
      mkdir -p ${pkgdir}/usr/bin
      mkdir -p ${pkgdir}/usr/share/applications/
      mkdir -p ${pkgdir}/usr/share/pixmaps/

      install -m 777 ${_pkgname}  ${pkgdir}/usr/bin/${_pkgname}
      install -m 644 ${_pkgname}.desktop ${pkgdir}/usr/share/applications/
      install -m 644 ${_pkgname}-icon ${pkgdir}/usr/share/pixmaps/${_pkgname}.png
    }

# vim:set ts=2 sw=2 et:
