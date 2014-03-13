# Maintainer: Alexander Fasching <fasching dot a91 at gmail dot com>
# Submitter: David Serrano <david dot nonamedguy at gmail dot com>

pkgname=bochs-pintos
_pkgrealname=bochs
pkgver=2.6.2
pkgrel=2
pkgdesc="A portable x86 PC emulation software with pintos patches applied"
arch=(i686 x86_64)
license=('LGPL')
url="http://bochs.sourceforge.net/"
source=('001-bochs-2.6.2-jitter.patch'
        '002-bochs-2.6.2-page-fault-segv.patch'
        '003-bochs-2.6.2-ms-extensions.patch'
        '004-bochs-2.6.2-triple-fault.patch'
        http://sourceforge.net/projects/${_pkgrealname}/files/${_pkgrealname}/${pkgver}/${_pkgrealname}-${pkgver}.tar.gz)
        
sha256sums=('2badfd569c092a961270e82382f2a90a704f25e72cd902ab70c4a27313023dd6'
            '21226c00034dac4db5c810e8f3437518c25fa60a63e951c2b99d9f05ba0221e9'
            '073279f3a9bd3929a823f8fa6b4165fa154ec9ea5d3a30fcca435fe84bb64553'
            'de8c22e39eb1121480bf85303ae44dfd5e1ae88e5c41f9d3b982ff7aa52d312e'
            'd973b72b79a5de96ebe9337b8421f19dcd775dce16ed25a0232fa6d543a54b10')
depends=('libxrandr' 'libxpm')
conflicts=('bochs')

build() {
	cd "${srcdir}/${_pkgrealname}-${pkgver}"
    patch -p1 < "${srcdir}/001-bochs-2.6.2-jitter.patch"
    patch -p1 < "${srcdir}/002-bochs-2.6.2-page-fault-segv.patch"
    patch -p1 < "${srcdir}/003-bochs-2.6.2-ms-extensions.patch"
    patch -p1 < "${srcdir}/004-bochs-2.6.2-triple-fault.patch"
	./configure	\
        --prefix=/usr	\
        --with-nogui \
        --with-x \
        --with-x11 \
        --with-term \
        --enable-gdb-stub
	make
}

package() {
    cd "${srcdir}/${_pkgrealname}-${pkgver}"

    make prefix=${pkgdir}/usr install
}
