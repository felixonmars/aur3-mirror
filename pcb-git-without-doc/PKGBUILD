# Maintainer: Kharkovskiy Alexey <svetonomer@gmail.ru>
# Redesign of pcb-git PKGBUILD :)
pkgname=pcb-git-without-doc
pkgver=20141206
pkgrel=1
pkgdesc="Print circuit board editor without Texlive documentation. For Disable of layer Transparency uncomment the --disable-gl option for configure in BUILD section. For compile with LESSTIF GUI uncomment the --with-gui=lesstif option"
arch=('any')
url="http://pcb.geda-project.org"
license=('GPL')
groups=()
depends=('dbus' 'gtkglext' 'gd')
makedepends=('git' 'intltool' 'texlive-core' 'ghostscript' 'mesa')
optdepends=('tk: for the graphical QFP footprint builder')
provides=('pcb')
conflicts=('pcb')
replaces=()
backup=()
options=()
#install=$pkgname.install
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_gitroot="git://git.geda-project.org/pcb.git"
_gitname="pcb"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

#  if ls $srcdir/$_gitname-build; then
	  cp -auv "$srcdir/$_gitname" "$srcdir/$_gitname-build";
#	fi;
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #

  if [ ! -x /usr/bin/wish ]; then
     config="env WISH=/usr/bin/true ./configure"
  else
     config="./configure"
  fi

  ./autogen.sh
  $config \
	  --without-doc \
	  --disable-doc \
      --prefix=/usr \
      --enable-dbus \
      --disable-update-mime-database \
      --disable-update-desktop-database \
	  --with-gui=lesstif \
	  --disable-gl \

  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make -j1 prefix=$pkgdir/usr install
} 
