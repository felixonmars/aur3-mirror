# Maintener wido <widowild [at] myopera [dot] com>

pkgname=ut2004-megapack
pkgver=1
pkgrel=1
pkgdesc="MegaPack for Unreal Tournament 2004 (ut2004) add vehicles: SPMA,Paladin and Cicada"
arch=('any')
url="http://www.unrealtournament.com/"
license=('custom')
depends=('ut2004')

source=('http://downloads.unrealadmin.org/UT2004/BonusPack/ut2004megapack-linux.tar.bz2')

md5sums=('098be93d06823c5fd416fa701e83418f')

build() {

    install -d $pkgdir/opt/ut2004/{Animations,Help,Maps,Music,Sounds,Speech,StaticMeshes,System,Textures,Web}

    cp -a $srcdir/UT2004MegaPack/{Animations,Help,Maps,Music,Sounds,Speech,StaticMeshes,System,Textures,Web} $pkgdir/opt/ut2004/
}
