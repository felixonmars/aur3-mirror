# Maintainer: Michał Siejak <my_fistname@my_lastname.pl>
pkgname=xlsh-git
pkgver=0.2.2
pkgrel=1
pkgdesc="eXtended Login Shell - fast, minimalistic login/xdm replacement"
arch=('i686' 'x86_64')
url="https://github.com/Nadrin/xlsh/wiki"
license=('GPL3')
depends=('pam' 'readline' 'xterm' 'xdotool' \
         'xorg-xsetroot' 'xorg-xwininfo' 'xorg-xmessage' 'xorg-xrdb')
makedepends=('git')
optdepends=('feh: Setting X background image when run by xlshd')
provides=('xlsh')
conflicts=('xlsh')
install=xlsh.install

_giturl="https://github.com/Nadrin/xlsh.git"
_gitname="xlsh"

build() {
  cd "$srcdir"

  msg "Downloading source from GIT server ..."
  rm -rf "$_gitname"
  git clone "$_giturl" "$_gitname"

  msg "Configuring ..."
  cd "$srcdir/$_gitname"
  sed -i "s:prefix = /usr/local:prefix = /usr:" Makefile

  msg "Starting make ..."
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir" install
}
