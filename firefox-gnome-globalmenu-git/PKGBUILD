# Contributor: lh <jarryson@gmail.com>

pkgname=firefox-gnome-globalmenu-git
pkgver=20101120
pkgrel=1
pkgdesc="A (hacky) Firefox extension that shows the standard Firefox menu bar on the Gnome global menu bar."
url="http://gitorious.org/firefox-gnome-globalmenu/firefox-gnome-globalmenu"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gnome-globalmenu' 'firefox')
makedepends=('git' 'xulrunner' 'zip' 'unzip')
optdepends=()
options=('!libtool')
conflicts=()
provides=('firefox-gnome-globalmenu')
replaces=()
install=
source=()
md5sums=()

_gitroot=git://gitorious.org/firefox-gnome-globalmenu/firefox-gnome-globalmenu.git
_gitname=firefox-gnome-globalmenu

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"

  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  cp -rf "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
  
  #patch -Np1 -i $startdir/4.0.patch
  emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf)
  mkdir -p components
  make -C src dist|| return 1
  install -d ${pkgdir}/usr/lib/firefox-3.6/extensions
  unzip globalmenu.xpi -d ${pkgdir}/usr/lib/firefox-3.6/extensions/$emid
}
# vim:syntax=sh
