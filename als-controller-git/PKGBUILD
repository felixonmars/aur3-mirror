# Maintainer: Teo Mrnjavac <teo@kde.org>

pkgname=als-controller-git
pkgver=20140521
pkgrel=1
pkgdesc="ASUS Zenbook ambient light sensor userspace controller."
arch=('i686' 'x86_64')
url="https://github.com/danieleds/Asus-Zenbook-Ambient-Light-Sensor-Controller"
license=('Apache')
depends=('qt5-base')
makedepends=('git' 'als-driver-git')
provides=('als-controller')
conflicts=('als-controller')

_gitroot=git://github.com/danieleds/Asus-Zenbook-Ambient-Light-Sensor-Controller.git
_gitname=Asus-Zenbook-Ambient-Light-Sensor-Controller

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "${_gitname}" ]]; then
    cd "${_gitname}" && git pull origin
    msg "The local files are updated."
  else
    git clone "${_gitroot}" "${_gitname}"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  cd "$srcdir/${_gitname}/service"
  
  if test "$CARCH" == "x86_64"; then
    qmake als-controller.pro -r -spec linux-g++-64
  else
    qmake als-controller.pro -r -spec linux-g++
  fi

  make || return 1
}
package() {
  cd "$srcdir/${_gitname}"
  mkdir -p "$pkgdir/usr/share/als-controller/example/images/"
  mkdir -p "$pkgdir/usr/share/als-controller/service/"

  install -m 755 "service/als-controller" "$pkgdir/usr/share/als-controller/service/"
  install -m 755 "example/switch.sh" "$pkgdir/usr/share/als-controller/example/"
  install        "example/images/active.svg" "$pkgdir/usr/share/als-controller/example/images/"
  install        "example/images/inactive.svg" "$pkgdir/usr/share/als-controller/example/images/"
}

