pkgname=lirc-gcujoyfb-module
pkgver=20120302
pkgrel=1
#_kernver=2.6.36-ARCH
pkgdesc="Lirc driver for ATMEGA8-based infrared remote receiver with GCuJoyFB/N firmware. Old project name is lirc-igorhid."
arch=('i686' 'x86_64')
url="http://code.google.com/p/lirc-gcujoyfb/"
license=('GPL3')
depends=('udev' 'linux>2.6.39')
makedepends=('help2man' 'linux-headers>=2.6.35' 'git')
#replaces=('lirc+pctv')
options=('!makeflags')
install=$pkgname.install
source=()
_gitroot=https://code.google.com/p/lirc-gcujoyfb/
_gitname=lirc_igorhid

build() {
  cd "$srcdir"
  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi
  
  cd "$srcdir/$_gitname/$_gitname"
  
  make all
}

package() {
  cd "$srcdir/$_gitname/$_gitname"
  install -D -m644 lirc_igorhid.ko ${pkgdir}/lib/modules/$(uname -r)/updates/lirc_igorhid.ko
  
  mkdir -p "$pkgdir/etc/udev/rules.d"
  cd "$srcdir/$_gitname"
  install -D -m644 90-lirc.rules ${pkgdir}/etc/udev/rules.d
}