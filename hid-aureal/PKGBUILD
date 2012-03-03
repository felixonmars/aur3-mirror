#Maintainer: dosfish <bcropley@internode.on.net>
#Contributor: Alexandr Mekh <alexandr.mekh@gmail.com>

pkgname=hid-aureal
pkgver=20120303
pkgrel=1
pkgdesc="Kernel module to fix support for Aureal Cy se W-01RN USB remote control."
arch=('i686' 'x86_64')
url="http://gitorious.org/hid-aureal-kernel-module"
license=('GPL')
depends=('linux>2.6.39')
makedepends=('linux-headers>=2.6.35' 'git')
options=('!makeflags')
install=$pkgname.install
source=()
_gitroot=git://gitorious.org/hid-aureal-kernel-module/hid-aureal-kernel-module.git
_gitname=hid-aureal

build() {
  cd "$srcdir"
  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi
  
  cd "$srcdir/$_gitname"
  
  make 
}

package() {
  cd "$srcdir/$_gitname"
  install -D -m644 hid-aureal.ko ${pkgdir}/lib/modules/$(uname -r)/updates/hid-aureal.ko
}
