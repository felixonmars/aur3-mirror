# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=qubes-vm-kernel-modules
pkgver=1
pkgrel=5
kernelver=`pacman -Qi linux | grep Version | cut -d ":" -f 2`
kernelver=${kernelver//[[:space:]]/}-ARCH
epoch=
pkgdesc=""
arch=("x86_64")
url="http://qubes-os.org/"
license=('GPL')
groups=()
depends=(qubes-vm-core)
makedepends=(qubes-vm-core linux-headers)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=qubes-vm-kernel-modules.install
changelog=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

qubesrepo=marmarek

build() {
  git clone git://git.qubes-os.org/$qubesrepo/kernel

  cd kernel/u2mfn

  make -C /lib/modules/$kernelver/build/ SUBDIRS=`pwd` modules \
	EXTRA_CFLAGS=-I`pwd`/../xenincl 

  #sh buildme.sh
}


package() {
  cd kernel/u2mfn
  
  mkdir -p $pkgdir/lib/modules/`uname -r`/updates/

  install -D -m 0744 u2mfn.ko $pkgdir/lib/modules/$kernelver/updates/u2mfn.ko
}


# vim:set ts=2 sw=2 et:
