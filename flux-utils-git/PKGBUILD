# $Id: PKGBUILD 7017 2009-12-29 20:22:18Z jlichtblau $
# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Andreas Wagner <A.Wagner@stud.uni-frankfurt.de>

pkgname=flux-utils-git
pkgver=20150215
pkgrel=1
pkgdesc="Scripts and utilities included in flux capacity"
arch=('any')
url=(http://fluxcapacity.99k.org)
license=('GPL2')
depends=('samba' 'cups' 'yad' 'util-linux-ng')
makedepends=(git)
optdepends=()
source=()
md5sums=()

_gitroot="git://github.com/empthollow/fc-utils.git"
_gitname="src"

msg "Connecting to the GIT server...."
    if [[ -d $_gitname ]] ; then
        cd $_gitname
        git pull origin
        msg "The local files are updated..."
    else
        git clone --depth=1 $_gitroot $_gitname 
    fi
    
    msg "GIT checkout done."

package() {
mkdir -p ${pkgdir}/usr/bin
mkdir -p ${pkgdir}/usr/share/applications
cp -p ${srcdir}/addflash ${pkgdir}/usr/bin
cp -p ${srcdir}/afpgui ${pkgdir}/usr/bin
cp -p ${srcdir}/cupsadm ${pkgdir}/usr/bin
cp -p ${srcdir}/fchelp ${pkgdir}/usr/bin
cp -p ${srcdir}/flux2hd ${pkgdir}/usr/bin
cp -p ${srcdir}/orphan ${pkgdir}/usr/bin
cp -p ${srcdir}/daemon ${pkgdir}/usr/bin
cp -p ${srcdir}/daemondialog ${pkgdir}/usr/bin
cp -p ${srcdir}/smbadm ${pkgdir}/usr/bin
cp -p ${srcdir}/wallpaper.desktop ${pkgdir}/usr/share/applications/
}
