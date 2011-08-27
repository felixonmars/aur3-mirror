# Contributor: Cilyan Olowen <gaknar@gmail.com>
pkgname=lxterminal-git
pkgver=20100601
pkgrel=1
pkgdesc="VTE-based terminal emulator (part of LXDE)"
arch=('i686' 'x86_64')
url="http://lxde.org/"
license=('GPL')
depends=('gtk2>=2.12.0' 'fontconfig' 'libx11' 'glib2' 'vte')
makedepends=('pkgconfig' 'intltool' 'git')
conflicts=('lxterminal')
provides=('lxterminal')
groups=('lxde-git')
source=()
md5sums=()

_gitroot='git://lxde.git.sourceforge.net/gitroot/lxde/lxterminal'
_gitname='lxterminal'

build() {
  cd "${srcdir}"
  
  if [ -d "${srcdir}/${_gitname}" ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi
  msg "GIT checkout done or server timeout. Preparing sources..."

  [ -d "${srcdir}/${_gitname}-build" ] && rm -rf "${srcdir}/${_gitname}-build"
  cp -r "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-build"
  cd "${srcdir}/${_gitname}-build"
  
  msg "Starting make..."

  # Generating Makefile, etc
  ./autogen.sh || return 1

  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --localstatedir=/var || return 1
  
  # Make and install without man pages
  make SUBDIRS="src data po" || return 1
  make SUBDIRS="src data po" DESTDIR="${pkgdir}" install || return 1
}
