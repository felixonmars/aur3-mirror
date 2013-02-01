# $Id$
# Contributor: Alexander Baldeck <kth5@archlinux.org>
# Contributor: Sébastien Mazy <melyadon@gmail.com>
# Contributor: Gilrain <pierre.buard+aur gmail com>
pkgname=xkeyboard-config-git
pkgver=20130201
pkgrel=1
pkgdesc="X keyboard configuration files (git version)"
arch=(any)
license=('custom')
url="http://www.freedesktop.org/wiki/Software/XKeyboardConfig"
depends=('xorg-xkbcomp')
makedepends=('git' 'intltool' 'xorg-util-macros')
provides=('xkbdata' 'xkeyboard-config')
replaces=('xkbdata')
conflicts=('xkbdata')

_gitroot="git://anongit.freedesktop.org/git/xkeyboard-config"
_gitname="xkeyboard-config"

build() {
  cd "${srcdir}/"
  msg "Connecting to GIT server...."

  if [ -d ${_gitname} ]; then
     cd ${_gitname} && git pull origin
     msg "The local files are updated."
  else
     git clone ${_gitroot} ${_gitname}
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting install..."

  cp -r "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-build"

  cd "${srcdir}/${_gitname}-build/"
  ./autogen.sh
  ./configure --prefix=/usr \
              --with-xkb-base=/usr/share/X11/xkb \
              --with-xkb-rules-symlink=xorg \
              --enable-compat-rules=yes
  make
}

package() {
  cd "${srcdir}/$_gitname-build/"
  make DESTDIR="${pkgdir}" install
  rm -f "${pkgdir}/usr/share/X11/xkb/compiled"
  install -m755 -d "${pkgdir}/var/lib/xkb"
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
