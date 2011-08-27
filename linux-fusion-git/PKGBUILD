
# Contributor:	bountykiller		<gmail.com: masse.nicolas>
# Contributor:	Georgios N. Tsalikis	<tsalikis.net: aliverius>
# Contributor:	Jesse Jaara		<gmail.com: jesse.jaara>                      

pkgname=linux-fusion-git
pkgver=20110404
pkgrel=1
pkgdesc="Kernel module providing the IPC for DirectFB multi-app, FusionSound & FusionDale"
arch=('i686' 'x86_64')
url="http://www.directfb.org"
license="GPL2"
makedepends=('git' 'kernel26-headers')
provides=('linux-fusion=8.3.0')
conflicts=('linux-fusion')
install=$pkgname.install
source=(30-fusion.rules)
md5sums=('3c78337fceaa897d536a93ae840cdd19')

_gitroot="git://git.directfb.org/git/directfb/core/linux-fusion.git"
_gitname="linux-fusion"

### To build for a kernel, other than the one in use ###
### Please set its name here.			     ###
kversion=`uname -r`
##

build() {
  msg "Connecting to git.directfb.org GIT server...."

  if [[ -d "${srcdir}/${_gitname}" ]] ; then
    cd ${_gitname}
    git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot}
  fi

  msg "GIT checkout done"

  # Remove old -build
  rm -rf "${srcdir}/${_gitname}-build"

  cp -r "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-build"
  cd "${srcdir}/${_gitname}-build"

  msg "Starting make..."

  make KERNEL_VERSION="${kversion}" modules

}

package() {
	cd "${srcdir}/${_gitname}-build"
	echo "INSTALLING"

	install -D -m644 "${srcdir}/${_gitname}-build/linux/drivers/char/fusion/fusion.ko" \
				"${pkgdir}/lib/modules/${kversion}/kernel/drivers/char/fusion.ko"
	gzip "${pkgdir}/lib/modules/${kversion}/kernel/drivers/char/fusion.ko"
	install -D -m644 "${srcdir}/${_gitname}-build/linux/include/linux/fusion.h" "${pkgdir}/usr/include/linux/fusion.h"
	install -D -m644 "${srcdir}/30-fusion.rules" "${pkgdir}/etc/udev/rules.d/30-fusion.rules"
}
