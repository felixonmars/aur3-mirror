# Maintainer: Erufu / Sébastien Lacroix <erufu.sennin@gmail.com>
# Maintainer: Bartek Piotrowski <barthalion@gmail.com>
# Contributor: AddiKT1ve <the.addikt1ve@gmail.com>
# Contributor: Erus <erus.iluvatar@gmail.com>

pkgname=wmfs-git
pkgver=20120117
pkgrel=1
pkgdesc="A lightweight and highly configurable tiling window manager for X"
arch=('i686' 'x86_64')
url="http://www.wmfs.info/"
license=('BSD')
depends=('libxft' 'imlib2' 'libxinerama' 'libxrandr')
makedepends=('git')
provides=('wmfs')
conflicts=('wmfs' 'wmfs2-git')

_gitroot="https://github.com/xorg62/wmfs.git"
_gitname="wmfs"

build() {
  cd "${srcdir}"
  msg "Connecting to GIT server..."

  if [ -d ${_gitname} ]; then
    cd ${_gitname} && git pull origin
    msg "The local files are updated."
  else
    git clone -b wmfs1 ${_gitroot} ${_gitname}
  fi
  msg "GIT checkout done or server timeout."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  ./configure --prefix /usr \
              --xdg-config-dir /etc/xdg \
              --man-prefix /usr/share/man
  make
}

package() {
  cd ${srcdir}/${_gitname}-build

  make DESTDIR=${pkgdir} install
  install -D -m644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}

