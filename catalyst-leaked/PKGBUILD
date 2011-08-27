_kernver=2.6.30-ARCH

pkgname=catalyst-leaked
pkgver=8.650
pkgrel=1
pkgdesc="AMD/ATI kernel drivers for Radeon brand cards. Stock kernel"
arch=('x86_64')
url="http://www.ati.amd.com"
license=('custom')
depends=("kernel26>=2.6.30" "kernel26<2.6.31")
replaces=('ati-fglrx' 'fglrx' 'catalyst' 'catalyst-utils') # Yay rebranding
conflicts=('catalyst-leaked' 'libgl' 'ati-drivers-module' 'ati-drivers' 'nvidia' 'catalyst-utils')
provides=('catalyst-utils' 'catalyst-leaked' 'libgl')
install=catalyst-leaked.install
source=(fglrx-amdcccle_${pkgver}-0ubuntu1_amd64.deb fglrx-kernel-source_${pkgver}-0ubuntu1_amd64.deb fglrx-modaliases_${pkgver}-0ubuntu1_amd64.deb libamdxvba1_${pkgver}-0ubuntu1_amd64.deb xorg-driver-fglrx-dev_${pkgver}-0ubuntu1_amd64.deb xorg-driver-fglrx_${pkgver}-0ubuntu1_amd64.deb )
md5sums=('e9aa8512e322ded77b390cedf6a296ef'
'c3e775c202721e5bf85ff77438a2d167'
'76a4f6363774da4dafcbb4149cfee4c4'
'e45df97bb48821b7b9bdb0628995bde1' 
'7e9b020114f5867178cfd255ff2a1a34'
'b1277385962fd1d2690572dfce1a43bc'
)


build() {
#unpack debs
ar p fglrx-amdcccle_${pkgver}-0ubuntu1_amd64.deb data.tar.gz | tar zx
ar p fglrx-kernel-source_${pkgver}-0ubuntu1_amd64.deb data.tar.gz | tar zx
ar p fglrx-modaliases_${pkgver}-0ubuntu1_amd64.deb data.tar.gz | tar zx
ar p libamdxvba1_${pkgver}-0ubuntu1_amd64.deb data.tar.gz | tar zx
ar p xorg-driver-fglrx-dev_${pkgver}-0ubuntu1_amd64.deb data.tar.gz | tar zx
ar p xorg-driver-fglrx_${pkgver}-0ubuntu1_amd64.deb data.tar.gz | tar zx

#create module, copy, delete src
cd usr/src/fglrx-${pkgver}/
./make.sh
mkdir -p ${srcdir}/lib/modules/${_kernver}/misc
cp ${srcdir}/usr/src/fglrx-${pkgver}/fglrx.ko ${srcdir}/lib/modules/${_kernver}/misc
rm -R ${srcdir}/usr/src

#copy package contents
cp -R ${srcdir}/usr ${srcdir}/lib ${srcdir}/etc ${pkgdir}
}
