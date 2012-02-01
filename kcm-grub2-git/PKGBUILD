# Maintainer: vicky91 <vickypaiers@gmail.com>
pkgname=kcm-grub2-git
pkgver=20120131
pkgrel=1
pkgdesc="A KCModule for configuring the GRUB2 bootloader."
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php?content=139643"
license=('GPL')
depends=('kdelibs' 'imagemagick')
makedepends=('cmake' 'automoc4' 'git' 'imagemagick')

_gitroot='git://anongit.kde.org/kcm-grub2'
_gitname='kcm-grub2'

build() {
  cd "${srcdir}"
  msg "Connecting to GIT server...."

  if [[ -d "${_gitname}" ]]; then
    cd "${_gitname}" && git pull origin
    msg "The local files are updated."
  else
    git clone "${_gitroot}" "${_gitname}"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "${srcdir}/${_gitname}-build"
  git clone "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-build"
  cd "${srcdir}/${_gitname}-build"

  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${_gitname}-build"
  make DESTDIR="${pkgdir}/" install
}

# vim:set ts=2 sw=2 et:

