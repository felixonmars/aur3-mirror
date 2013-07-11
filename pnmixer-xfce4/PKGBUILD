# Maintainer: Mike Krueger <info@memoryleakx.dudmail.com>
pkgname=pnmixer-xfce4
pkgver=3
pkgrel=1
pkgdesc="PNMixer is a GTK volume mixer applet. Fixed: Child Process pavucontrol becomes to a zombie process after close. Fixed: improve mouse wheel speed."
arch=('i686' 'x86_64')
license=('GPL-3')
url="https://github.com/memoryleakx/pnmixer-xfce4"
depends=('gtk2' 'alsa-lib')
optdepends=('pavucontrol')
makedepends=('git')
provides=('pnmixer')
conflicts=('pnmixer')
groups=('pnmixer')

_gitroot="git://github.com/nicklan/pnmixer.git"
_gitname="pnmixer"

_gitpatchroot="git://github.com/memoryleakx/pnmixer-xfce4.git"
_gitpatchname="pnmixer-xfce4"

build() {

  cd "${srcdir}"

  
  if [ -d ${srcdir}/$_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot}
    git clone ${_gitpatchroot}
  fi

  mv ${srcdir}/$_gitpatchname/* ${srcdir}

  patch -Np0 -i improveMousewheelSpeedPatch03.patch
  patch -Np0 -i antiZombiePatch03.patch
}

package() {
   cd ${srcdir}/${_gitname}


  ./autogen.sh || return 1
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR="$pkgdir" install || return 1
}
