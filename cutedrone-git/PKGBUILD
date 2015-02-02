# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from GIT sources.

# Maintainer: Maximilian Berger <snowdragon92[at]gmail.com>
pkgname=cutedrone-git
pkgver=1.0.0
pkgrel=1
pkgdesc="AR Drone 2.0 SDK written in C++ and QT"
arch=('x86_64')
url="https://burntbunch.org:1337/burntbunch/cutedrone"
license=('LGPLv2')
groups=('devel')
depends=('qt5-base'
         'opencv')
makedepends=('git')
provides=('cutedrone')
source=('cutedrone.sh'
        'cutedrone.desktop')

sha256sums=('6b9e17f87d8bb1efb8affd197842200024944e3d85a69de88a5961506b6fe9d0'
            '9d69d20607fefb17e20008ecbbe8405cfc8473b063c0db6f021b3dd601f91259')

_gitroot='https://burntbunch.org:1337/burntbunch/cutedrone.git'
_gitname='cutedrone'

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git -c http.sslVerify=false pull origin
    msg "The local files are updated."
  else
    git -c http.sslVerify=false clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git -c http.sslVerify=false clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #
  #echo "" >> CuteDrone.pro
  #echo "target.path = /usr/local/bin/" >> CuteDrone.pro
  #echo "target.files = CvDrone" >> CuteDrone.pro
  #echo "INSTALLS += target" >> CuteDrone.pro
  qmake -makefile -unix CuteDrone.pro
  msg "qmake done"
  make
  msg "make done"
  #running qmake again so the binary shows up in Makefile for make install later
  #qmake -makefile -unix CuteDrone.pro
}

package() {
  cd "$srcdir/$_gitname-build"
  #make DESTDIR="$pkgdir/" install

  install -d "${pkgdir}/usr/share/cutedrone"
  install -Dm755 "CvDrone" "${pkgdir}/usr/share/cutedrone"

  install -Dm755 "${srcdir}/cutedrone.sh" "${pkgdir}/usr/bin/cutedrone"

  install -Dm644 "${srcdir}/cutedrone.desktop" "${pkgdir}/usr/share/applications/cutedrone.desktop"
}

# vim:set ts=2 sw=2 et:
