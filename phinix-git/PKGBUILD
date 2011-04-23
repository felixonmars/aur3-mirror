# Contributor: Alexandre Petitjean <alpetitjean_gmail dot_com>

pkgname="phinix-git"
pkgver=20110423
pkgrel=1
pkgdesc="A very light and simple Qt music player"
url="https://codaset.com/alexandrep/phinix"
license=("GPL-3")
arch=("i686" "x86_64")
depends=("qt" "phonon")
makedepends=("git")
provides=("phinix")
conflicts=("phinix phinix-svn")
source=()
md5sums=()

_gitroot="https://codaset.com/alexandrep/phinix.git"
_gitname="phinix"

build() {
  cd $srcdir
  msg "Connecting to the GIT server...."
  
  if [[ -d $srcdir/$_gitname ]] ; then
    cd $_gitname
    git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
    cd $_gitname
  fi
  
  msg "GIT checkout done"
  msg "Starting make..."

  qmake || return 1
  make || return 1

  install -D -m755 "${srcdir}/phinix/phinix" "${pkgdir}/usr/bin/phinix"
  install -D -m644 "${srcdir}/phinix/resources/phinix.png" "${pkgdir}/usr/share/pixmaps/phinix.png"
  install -D -m644 "${srcdir}/phinix/resources/phinix.desktop" "${pkgdir}/usr/share/applications/phinix.desktop"
}
