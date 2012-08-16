#Maintainer: Roman Lapin <lampus.lapin@gmail.com>

pkgname=('linux-gpib-svn')
pkgver=1589
pkgrel=4
pkgdesc='A support package for GPIB (IEEE 488) hardware.'
arch=('i686' 'x86_64')
url='http://linux-gpib.sourceforge.net/'
license=('GPL')
makedepends=('subversion' 'linux-headers' 'bison<=2.5.1')
depends=('bash' 'linux>=3.0' 'linux<=3.5')
source=('gpib_build.patch' 'fix-asm-includes.patch')
md5sums=('2687559f95d5614bb5651ff6f0ce5aee' '1383f6a53a3beb105364dbcedad1bfd1')
install='linux-gpib.install'

_svntrunk=https://linux-gpib.svn.sourceforge.net/svnroot/linux-gpib/trunk/linux-gpib
_svnmod=linux-gpib
_kernver=$(uname -r)
_extramodules=/lib/modules/${_kernver}/extramodules/

build() {
    if [[ -d "$_svnmod/.svn" ]]; then
	(cd "$_svnmod" && svn up -r "$pkgver")
    else
	svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
    fi
    cd $srcdir/$_svnmod

    patch -Np0 -i "${srcdir}/../gpib_build.patch" || return 1
    patch -Np1 -i "${srcdir}/../fix-asm-includes.patch" || return 1

    ./bootstrap
    ./configure \
	--prefix=/usr \
	--with-linux-srcdir=/usr/src/linux-${_kernver} \
	--disable-guile-binding \
	--disable-perl-binding \
	--disable-php-binding \
	--disable-python-binding \
	--disable-tcl-binding
    make || return 1
}

package() {
  cd "${srcdir}/${_svnmod}"
  make INSTALL_MOD_PATH="${pkgdir}" DESTDIR="${pkgdir}" install
  mkdir -p ${pkgdir}/${_extramodules}
  mv ${pkgdir}/lib/modules/${_kernver}/gpib ${pkgdir}/${_extramodules}/
  find ${pkgdir} -depth -type d -empty -exec rmdir {} \;
}
