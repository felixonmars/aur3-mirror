##This is a basic PKGBUILD for rdis to ease building RDIS in my Arch boxes
##Maintainer : TDKPS
##Implemented fixes by ackalker. Kudos to him.
pkgname=rdis
pkgrel=1
pkgver=20121230
pkgdesc="A great graphic binary analysis tool that's in-development and constantly being improved.
Check rdis-lua for some scripts that improve it's functionality. "
arch=(x86_64)
url="https://github.com/TDKPS/rdis"
license=('GPLv3')
depends=(gtk3 luajit cairo jansson git udis86)
optdepends=(lua51-socket)
_gitroot="https://github.com/TDKPS/rdis.git"
_gitname="rdis"


build() {
  cd "$srcdir"

  msg "Connecting to GIT server..."
  if [[ -d ${_gitname} ]]; then
    (cd ${_gitname} && git pull origin)
  else
    git clone ${_gitroot} ${_gitname}
  fi
  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf ${_gitname}-build
  git clone ${_gitname} ${_gitname}-build

  cd ${srcdir}/${_gitname}-build/
  
  if [ -d /usr/share/rdis ]; then
  cp ${srcdir}/${_gitname}-build/src/share/* /usr/share/rdis
  mv /usr/share/rdis/rdis-root.desktop /usr/share/applications/rdis
  else
  mkdir /usr/share/rdis
  cp ${srcdir}/${_gitname}-build/src/share/* /usr/share/rdis
  mv /usr/share/rdis/rdis-root.desktop /usr/share/applications/rdis
  fi

  sed -i 's,/usr/bin,$(DESTDIR)&,g' Makefile

make
}

package() {
  cd "$srcdir/$_gitname-build"
  install -m 0755 -d "$pkgdir/usr/bin"
  make DESTDIR="$pkgdir" install
}
