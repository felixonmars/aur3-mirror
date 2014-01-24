# Maintainer: Baraa Chiet <baraa.ch.95@gmail.com>

pkgname=flareget-official
_pkgname=flareget
_rel=2.4
_subrel=27
pkgver=${_rel}.${_subrel}
pkgrel=1
pkgdesc="FlareGet is a full featured, multi-threaded download manager and accelerator for Windows and Linux."
arch=('i686' 'x86_64')
url="http://flareget.com"
license=('custom')
depends=('glibc>=2.13' 'qt4>=4.8.1' 'libmetalink')
makedepends=('')

if  [ "${CARCH}" = "i686" ]; then
    _arch1="i686"
    _arch2=$_arch1
    md5sums=('SKIP')
elif [ "${CARCH}" = "x86_64" ]; then
    _arch1="x86_64"
    _arch2="amd64"
    md5sums=('SKIP')
fi

source=("http://www.flareget.com/files/flareget/pac/${_arch2}/${_pkgname}_${_rel}-${_subrel}_${_arch1}(stable)_pac.tar.gz")


build() {

   # Extract tar.gz package
tar zxvf  "${_pkgname}_${_rel}-${_subrel}_${_arch1}(stable)_pac.tar.gz"
cd $srcdir
cd "${_pkgname}_${_rel}-${_subrel}_${_arch1}(stable)_pac"
sudo pacman -U "${_pkgname}-${_rel}.${_subrel}-${pkgrel}-${_arch1}.pkg.tar.xz"
exit
}

