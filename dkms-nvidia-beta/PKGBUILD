# Maintainer: Anish Bhatt anish[at]gatech[dot]edu
# Former maintainer: Jason Melton <jason.melton@gmail.com>, Youpi <max.flocard@gmail.com>
# Contributor: Atilla ÖNTAŞ <tarakbumba@gmail.com>

pkgname=dkms-nvidia-beta
_pkgname=nvidia
pkgver=313.26
pkgrel=1
pkgdesc="NVIDIA dynamic kernel module (DKMS) drivers"
arch=(i686 x86_64)
url="http://www.nvidia.com/"
license=(custom)
depends=("dkms" "nvidia-utils-beta=${pkgver}")
#optdepends=("nvidia-utils=${pkgver}")
provides=("nvidia=${pkgver}")
conflicts=("nvidia")
install="${_pkgname}.install"
options=(!strip)

if [ "$CARCH" = "i686" ]; then
	_arch='x86'
	_pkg="NVIDIA-Linux-${_arch}-${pkgver}"
  source=("ftp://download.nvidia.com/XFree86/Linux-${_arch}/${pkgver}/${_pkg}.run")
  md5sums=('3c2f5138d0fec58b27e26c5b37d845b8')
elif [ "$CARCH" = "x86_64" ]; then
	_arch='x86_64'
	_pkg="NVIDIA-Linux-${_arch}-${pkgver}-no-compat32"
  source=("ftp://download.nvidia.com/XFree86/Linux-${_arch}/${pkgver}/${_pkg}.run")
  md5sums=('2d35124fa5a4b009f170fe893b5d07e3')
fi

source[1]="dkms.conf"
md5sums[1]='b1c393a72c83abe4d4d7fff479001b10'

source[2]='conftest.patch'
md5sums[2]='b391ae9ad430caecd3c353e3edda5979'

build() {
	cd $srcdir
	sh ${_pkg}.run --extract-only
	pushd "${_pkg}/kernel"
	patch -p3 < "${srcdir}/conftest.patch"
	popd
}

package() 
{
 	mkdir -p                                ${pkgdir}/usr/src/${_pkgname}-${pkgver}
 	cp -a       ${srcdir}/${_pkg}/kernel/*  ${pkgdir}/usr/src/${_pkgname}-${pkgver}
	cp          ${srcdir}/dkms.conf         ${pkgdir}/usr/src/${_pkgname}-${pkgver}

  install -d -m755 $pkgdir/etc/modprobe.d
  echo "blacklist nouveau" >> $pkgdir/etc/modprobe.d/nouveau_blacklist.conf
}
