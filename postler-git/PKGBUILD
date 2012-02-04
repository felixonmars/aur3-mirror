# Maintainer: Alessio Sergi <asergi at archlinux dot us>
# Contributor: boenki <boenki at gmx dot de>

pkgname=postler-git
_realname=postler
pkgver=20111005
pkgrel=1
pkgdesc="A super sexy, ultra simple desktop mail client"
arch=('i686' 'x86_64')
url="http://git.xfce.org/apps/postler"
license=('LGPL2.1')
depends=('desktop-file-utils' 'hicolor-icon-theme' 'libcanberra' \
         'libnotify' 'libwebkit3')
makedepends=('gettext' 'intltool' 'msmtp' 'vala')
optdepends=('dexter: for address book support'
            'lynx: for HTML to text conversion support')
provides=(${_realname})
conflicts=(${_realname})
install=${pkgname}.install

_gitroot="git://git.xfce.org/apps/${_realname}"
_gitname=${_realname}

build() {
  cd "${srcdir}"

  msg "Connecting to GIT server...."

  if [ -d ${_gitname} ] ; then
    cd ${_gitname} && git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot} ${_gitname}
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "${srcdir}/${_gitname}-build"
  git clone "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-build"
  cd "${srcdir}/${_gitname}-build"

  # python2 fix
  sed -i "s_#!/usr/bin/env python_#!/usr/bin/env python2_" waf

  ./waf configure --prefix=/usr \
                  --disable-libfolks \
                  --disable-libindicate \
                  --disable-libstemmer \
                  --disable-zeitgeist
  ./waf build
}

package() {
  cd "${srcdir}/${_gitname}-build"

  ./waf --destdir="${pkgdir}" install
}

