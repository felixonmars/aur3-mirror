# Maintainer: Matt
# based on Wingpanel PKGBUILD by Dan Serban

pkgname=ala-git
pkgver=20111209
pkgrel=1
pkgdesc="A space-saving top panel"
arch=(i686 x86_64)
url=https://github.com/quarterto/Ala
license=(GPL)
depends=(glib2 cairo libgee libindicator3 gtk3 libunique3)
makedepends=(git gettext intltool vala waf)
options=('!libtool' '!emptydirs')
#install=${pkgname}.install

_gitroot=https://github.com/quarterto/Ala
_gitname=Ala

build()
{
  msg "Connecting to Github..."
  if [ -d ${_gitname} ]; then
    cd ${_gitname}
    git pull
    msg2 "The local files have been updated."
    cd -
  else
    git clone ${_gitroot}
  fi
  msg2 "Git checkout done or server timeout"
  [ -d ${_gitname}-build ] && rm -r ${_gitname}-build
  cp -a ${_gitname} ${_gitname}-build
  cd ${_gitname}-build
  waf configure --prefix=/usr
  waf build
  DESTDIR="${pkgdir}" waf install
}

