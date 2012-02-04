# Maintainer: Corrado 'bardo' Primier <ilbardo@gmail.com>
# Contributor: Jabir Ali Ouassou
# Contributor: Alessio 'mOLOk' Bolognino <themolok@gmail.com>
# Contributor: Michal 'dta' Hybner <dta081@gmail.com>

pkgname=xevil
pkgver=2.02r2
pkgrel=2
pkgdesc="3rd person, side-view, fast-action, kill-them-before-they-kill-you game"
arch=('i686' 'x86_64')
url="http://www.xevil.com/"
license=('GPL')
depends=('gcc-libs' 'libxpm')
makedepends=('unzip')
source=(http://www.xevil.com/download/stable/xevilsrc${pkgver}.zip
        http://ftp.debian.org/debian/pool/main/x/xevil/xevil_$pkgver-9.diff.gz
        x86_64.patch)
md5sums=('09a9ef720b7204b0be68c4f462def370'
         '8b32d693de5a3e67e16eb7c0d78116c9'
         '33c9dcfd85e5c21db0f00de86a6db255')
noextract=(xevilsrc${pkgver}.zip)

build() {
  unzip -ao xevilsrc${pkgver}.zip

  patch -Np1 -i ${srcdir}/xevil_${pkgver}-9.diff
  patch -Np0 -i ${srcdir}/x86_64.patch
  sed --in-place\
      --expression='s:-static::'\
      --expression="s:CFLAGS=\":CFLAGS=\"${CFLAGS} :g"\
      --expression='s:-lXpm:-lXpm -lpthread:g'\
      config.mk

  make DEBUG_OPT="-O -DNDEBUG" || return 1

  install -Dm755 x11/REDHAT_LINUX/xevil ${pkgdir}/usr/bin/${pkgname}
  install -Dm755 x11/REDHAT_LINUX/serverping ${pkgdir}/usr/bin/${pkgname}-serverping
}

# vim:set ts=2 sw=2 et:
