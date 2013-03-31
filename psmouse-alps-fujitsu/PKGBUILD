# Mantainer: Tamás Eisenberger <tamas@eisenberger.hu>

pkgname=('psmouse-alps-fujitsu')
_patchver='1.0'
_dkmsname='psmouse-alps-fujitsu'
pkgver=${_patchver}
pkgrel=2
pkgdesc='psmouse kernel module with support for fujitsu touchpads with scroll wheel'
arch=('i686' 'x86_64')
url="http://www.eisenberger.hu/~u-foka/${pkgname}"
license=('GPL2')
depends=('dkms')
makedepends=('linux-headers')
conflicts=('psmouse-alps')
provides=('psmouse-alps')
options=('!strip')
install=psmouse.install
source=(
    "http://www.eisenberger.hu/~u-foka/${pkgname}/${pkgname}-${_patchver}.tar.gz"
)

md5sums=(
    '5701117c373ccbe8e4f4ed6c6d93eaa0'
)

build() {
	_K30=`uname -r | grep 3.0 || true`
	_K37=`uname -r | grep 3.7 || true`

	sed -e 's/{ { 0x73, 0x03, 0x50 }, 0x0d, ALPS_PROTO_V5, 0xc8, 0xc8, 0 },/ \
                        { { 0x73, 0x03, 0x50 }, 0x0d, ALPS_PROTO_V5, 0xc8, 0xc8, 0 }, \
                        { { 0x73, 0x03, 0x50 }, 0x02, ALPS_PROTO_V5, 0xc8, 0xc8, 0 },/g' \
                 -i ${srcdir}/usr/src/${_dkmsname}-${_patchver}/src/alps.c

	if [ "${_K30}" != "" ]; then
		echo "Patching for a 3.0 LTS kernel..."
		sed -e 's/BTN_TOOL_QUINTTAP/0x148/g' \
		  -i ${srcdir}/usr/src/${_dkmsname}-${_patchver}/src/synaptics.c
	fi

	if [ "${_K37}" != "" ]; then
		echo "Patching for a 3.7 kernel..."
		# Many thanks to figue for the quick patch ;)
		sed -e 's/input_mt_init_slots(dev, 2);/input_mt_init_slots(dev, 2, 0);/g' \
		  -i ${srcdir}/usr/src/${_dkmsname}-${_patchver}/src/synaptics.c \
		  -i ${srcdir}/usr/src/${_dkmsname}-${_patchver}/src/alps.c \
		  -i ${srcdir}/usr/src/${_dkmsname}-${_patchver}/src/elantech.c \
		  -i ${srcdir}/usr/src/${_dkmsname}-${_patchver}/src/sentelic.c
		sed -e 's/input_mt_init_slots(dev1, 2);/input_mt_init_slots(dev1, 2, 0);/g' \
		  -i ${srcdir}/usr/src/${_dkmsname}-${_patchver}/src/synaptics.c \
		  -i ${srcdir}/usr/src/${_dkmsname}-${_patchver}/src/alps.c
		sed -e 's/input_mt_init_slots(dev, ETP_MAX_FINGERS);/input_mt_init_slots(dev, ETP_MAX_FINGERS, 0);/g' \
		  -i ${srcdir}/usr/src/${_dkmsname}-${_patchver}/src/elantech.c
	fi

    mkdir -p ${pkgdir}/usr/src/${_dkmsname}-${_patchver}/src
    cp -RL ${srcdir}/usr/src/${_dkmsname}-${_patchver}/src/* ${pkgdir}/usr/src/${_dkmsname}-${_patchver}/src
    cp -RL ${srcdir}/usr/src/${_dkmsname}-${_patchver}/dkms.conf ${pkgdir}/usr/src/${_dkmsname}-${_patchver}
}
