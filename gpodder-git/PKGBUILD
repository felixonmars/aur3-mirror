# Maintainer: Levi0x0 (@levi0x0x aur)
# Contributor: DarkJesus <priestoftime@gmail.com>
# Contributor: Nicolas Quienot <niQo @ aur>

pkgname=gpodder-git
pkgver=3.6.1
pkgrel=1
pkgdesc="A podcast reciever/catcher."
license=('GPL')
arch=('any')
url="https://github.com/gpodder/gpodder"
depends=('pygtk' 'python2-feedparser' 'python2-dbus' 'python2-mygpoclient' 'xdg-utils')
conflicts=('gpodder' 'gpodder-svn')
provides=('gpodder')
makedepends=('gettext' 'help2man' 'intltool' 'git')
optdepends=('libgpod: for ipod support'
            'pymad: for ipod support'
            'mplayer: for ipod video support'
            'python-imaging: rockbox cover art support'
            'vorbis-tools: for ogg tag updating and converting to mp3'
            'lame: for converting ogg to mp3'
            'gnome-bluetooth: transfer podcast via bluethooth'
            'pywebkitgtk: render shownotes'
            'python-eyed3: for ipod support'
            'pymtp: for mtp support')
source=()
md5sums=()
install=gpodder-git.install

_gitroot=git://github.com/gpodder/gpodder.git
_gitname=gpodder

pkgver() {
    cd "gpodder"
    git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}
build() {
   cd ${srcdir}
   
  if [ -d ${srcdir}/$_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi
  
  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cp -r ${srcdir}/$_gitname ${srcdir}/$_gitname-build
  cd ${srcdir}/$_gitname-build

  PYTHON=python2 DESTDIR=${pkgdir} make install || return 1

  sed -i -e 's|#!/usr/bin/python$|#!/usr/bin/python2|' \
         -e 's|#!/usr/bin/env python$|#!/usr/bin/env python2|' \
    $(find $pkgdir/usr/lib/python2.7/site-packages/gpodder/ -name '*.py')
  
  cd ${srcdir}
  rm -rf $_gitname-build
}
