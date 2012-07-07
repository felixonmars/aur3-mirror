# Maintainer: Archlive <carbonjiao alt gmail dot com>
# Contributor:  Archlive <carbonjiao alt gmail dot com>

pkgname=save2loop
pkgver=9
pkgrel=1
pkgdesc="Boot and save changes to loop file support to initcpio of Arch"
arch=('any')
url="http://archlive-pkg.googlecode.com"
license=('GPL2')
depends=('mkinitcpio' 'aufs3' 'aufs3-util' 'e2fsprogs' 'coreutils' 'util-linux')
optdepends=('ntfs-3g: to enable place the loop files in ntfs partition')
source=()
install=$pkgname.install

_hgroot="https://save2loop.archlive-pkg.googlecode.com/hg/"
_hgrepo="save2loop"

build() 
{
    cd $srcdir
    [ -d ${_hgrepo} ] && rm -rf ${_hgrepo}
    hg clone ${_hgroot} ${_hgrepo}
    cd ${_hgrepo}
    install -Dm644 ${pkgname}_hook  ${pkgdir}/usr/lib/initcpio/hooks/${pkgname}
    install -Dm644 ${pkgname}_install  ${pkgdir}/usr/lib/initcpio/install/${pkgname}
}
