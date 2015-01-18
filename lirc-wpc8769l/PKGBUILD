# Maintainer: Lukas Fleischer <archlinux at cryptocrack dot de>
# Contributor: Paul Mattal <paul@archlinux.org>

pkgname=lirc-wpc8769l
_pkgname=lirc_wpc8769l
pkgver=0.9.2
_tag=lirc-0_9_2
pkgrel=1
pkgdesc="Linux Infrared Remote Control kernel modules"
arch=('i686' 'x86_64')
url="http://www.lirc.org/"
license=('GPL')
depends=('linux>=3.18' 'linux<3.19')
makedepends=('git' 'linux>=3.18' 'linux<3.19' 'linux-headers>=3.18' 'linux-headers<3.19')
replaces=('lirc+pctv')
install=lirc-wpc8769l.install
source=("$pkgname-$pkgver::git://lirc.git.sourceforge.net/gitroot/lirc/lirc#tag=$_tag")
md5sums=('SKIP')

_extramodules=extramodules-3.18-ARCH

build() {
  make -C "/usr/lib/modules/$(cat /usr/lib/modules/${_extramodules}/version)/build/" \
    M="$srcdir/$pkgname-$pkgver/drivers/$_pkgname/" modules
}

package() {
  cd "$srcdir/$pkgname-$pkgver/drivers/$_pkgname/"

  install -Dm0644 "${_pkgname}.ko" "${pkgdir}/usr/lib/modules/${_extramodules}/${_pkgname}.ko"
  gzip -9 "${pkgdir}/usr/lib/modules/${_extramodules}/${_pkgname}.ko"

  # set the kernel we've built for inside the install script
  sed -i "s/^EXTRAMODULES=.*$/EXTRAMODULES=${_extramodules}/" "${startdir}/${pkgname}.install"
}
