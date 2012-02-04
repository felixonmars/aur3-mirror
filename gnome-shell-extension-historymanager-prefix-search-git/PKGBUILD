#Submitter: anespor
#Maintainer: Alois Nespor <info@aloisnespor.info>

pkgname=gnome-shell-extension-historymanager-prefix-search-git
pkgver=20110718
pkgrel=1
pkgdesc="Use PageUp and PageDown to move in history of eg. RunCommand (Alt+F2) or Looking Glass according the command prefix"
arch=('any')
url="https://github.com/sustmi/gnome-shell-extensions-sustmi"
license=('GPL3')
depends=('gnome-shell-extensions-common' 'pkg-config')
makedepends=('git' 'gnome-common' 'autoconf' 'automake' 'intltool')
install=('gschemas.install')

_gitroot="git://github.com/sustmi/gnome-shell-extensions-sustmi.git"
_gitname="historymanager-prefix-search"
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
}

package() {
   cd "$srcdir/$_gitname/$_gitname/"
   sed -i -e "s|3.0|3.0.2|" metadata.json || return 1
   mkdir -p $pkgdir/usr/share/gnome-shell/extensions/historymanager-prefix-search@sustmidown.centrum.cz
   cp $srcdir/$_gitname/$_gitname/* $pkgdir/usr/share/gnome-shell/extensions/historymanager-prefix-search@sustmidown.centrum.cz
}
