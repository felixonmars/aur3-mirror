# -*- shell-script -*-
#
# Contributor: Adrian C. <anrxc.sysphere.org>

pkgname=rcdscripts-aic
_gitname=rcdscripts
pkgver=2013.06.29
pkgrel=2
pkgdesc="System service scripts for SysV init"
arch=("any")
url="http://git.sysphere.org/rcdscripts/"
license=("GPL2")
depends=("bash")
optdepends=("sysvinit: SysV init"
            "initscripts-aic: functions used by service scripts, SysV compatible")
source=("http://git.sysphere.org/${_gitname}/snapshot/${_gitname}-${pkgver}.tar.xz")
md5sums=("b9cfe34671e37e339a30c0cbb047434a")


package() {
  cd ${srcdir}/${_gitname}-${pkgver}

# Install documentation
  install -d "${pkgdir}/usr/share/${pkgname}/"
  install -m644 README "${pkgdir}/usr/share/${pkgname}/"

# Install scripts
  cp -r ./src/* ${pkgdir}/usr/share/${pkgname}/
}
