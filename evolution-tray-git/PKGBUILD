# Contributor: antzek9 <antze.k9 at googlemail dot com>
# Maintainer: antzek9
pkgname=evolution-tray-git
pkgver=20111010
pkgrel=2
pkgdesc="This plugin is useful when you want to put evolution in tray (notification area). This is the maybe unstable git 
version."
arch=('i686' 'x86_64')
url="http://gnome.eu.org/evo/index.php/Evolution_Tray"
license=('GPL')
groups=('office')
depends=('evolution>=2.30' 'libgnomeui' 'gconf' 'libnotify')
makedepends=('git' 'autoconf>=2.53' 'automake>=1.8' 'libtool>=1.4.3' 'glib2>=2.2.0' 'pkgconfig>=0.14.0' 'intltool>=0.25' 'gnome-common>=2.3.0')
provides=('evolution-tray-git')
conflicts=('evolution-tray')
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=()
_gitroot="git://gnome.eu.org/evolution-tray/"
_gitname="evolution-tray"


build() {
  cd ${srcdir}/

  msg "Connecting to the GIT server...."
  if [[ -d ${srcdir}/${_gitname} ]] ; then
      cd ${_gitname}
      git pull origin
      msg "The local files are updated..."
  else
     git clone ${_gitroot}
  fi
    
  msg "GIT checkout done."

  msg "Starting make for: ${pkgname}"

  if [[ -d ${srcdir}/${_gitname}-build ]]; then
     msg "Cleaning the previous build directory..." 
     rm -rf ${srcdir}/${_gitname}-build
  fi

  git clone ${srcdir}/${_gitname} ${srcdir}/${_gitname}-build
    
  cd ${srcdir}/${_gitname}-build

  msg "Starting configure..."

  ./autogen.sh --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir" install
}

