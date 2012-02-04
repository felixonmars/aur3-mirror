# Contributor: Cilyan Olowen <gaknar@gmail.com>
pkgname=lxinput-git
pkgver=20100221
pkgrel=1
pkgdesc="LXInput is a small program used to configure keyboard and mouse \
for LXDE."
arch=('i686' 'x86_64')
url="http://lxde.org/"
license=('GPL')
depends=('gtk2>=2.12.0')
makedepends=('git')
conflicts=('lxinput')
provides=('lxinput')
replaces=('lxinput-svn')
groups=('lxde-git')
source=()
md5sums=()

_gitroot='git://lxde.git.sourceforge.net/gitroot/lxde/lxinput'
_gitname='lxinput'

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
  make SUBDIRS="src po" || return 1
  make SUBDIRS="src po" DESTDIR="${pkgdir}" install || return 1
}
