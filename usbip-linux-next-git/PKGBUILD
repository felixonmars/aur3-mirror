# Maintainer: Jonathan Ryan <jryan@curious-computing.com>

pkgname=usbip-linux-next-git
pkgver=20111215
pkgrel=0
pkgdesc="usbip for linux-next from kernel.org git tree"
url="http://git.kernel.org/?p=linux/kernel/git/next/linux-next.git;a=summary"
arch=('x86_64' 'i686')
license=('GPLv2')
depends=()
optdepends=()
makedepends=('kernel-headers' 'wget' 'tar')
conflicts=()
replaces=()
backup=()
#install='foo.install'
source=()
md5sums=()

_dir=linux-next-usbip

build() {
  #extract 
  wget -O usbip.tgz 'http://git.kernel.org/?p=linux/kernel/git/next/linux-next.git;a=snapshot;h=ca89df931f296e469ed748da0a91c0af43e108d2;sf=tgz'
  rm -rf $_dir
  mkdir $_dir
  tar -xzf usbip.tgz --strip=1 -C $_dir
  cd "${srcdir}/${_dir}"

  # build
  ./autogen.sh || return 1
  ./configure  --prefix=/usr --sysconfdir=/etc --disable-caches \
    --disable-static --localstatedir=/var 
  make || return 1
}
 
package() {
  cd "${srcdir}/${_dir}"
  make DESTDIR="$pkgdir/" install
}
 
# vim:set ts=2 sw=2 et:
