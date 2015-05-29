# Maintainer: Cyrill Leutwiler <bigcyrill at hotmail dot com>

pkgname=('gns3-meta')
pkgbase=gns3-meta
pkgver=1.3.3
pkgrel=1
pkgdesc="This metapackage provides *everything* you need to get started with GNS3. GNS3 is a Graphical Network Simulator"
arch=('i686' 'x86_64')
url="http://www.gns3.com"
license=('GPL3')
depends=('python3' 'python-jsonschema' 'python-dateutil' 'python-jinja' 'python-paramiko' 'python-requests' 'python-sip' 'python-pyqt4' 'python-configobj' 'python-cx_freeze')
makedepends=('python-setuptools' 'cmake' 'flex' 'bison' 'elfutils' 'libpcap' 'python-pyqt4' 'python-sip' 'util-linux')
checkdepends=()
optdepends=(	'wireshark-gtk: Analyze Networktraffice inside GNS3'
		'virtualbox-gtk: Run virtual machines inside GNS3'
		'xterm: Connect to your virtual devices via console'
		'qemu: Used by GNS3 to run Cisco ASA, PIX and IDS')
provides=('gns3-server' 'gns3-gui' 'gns3-converter' 'dynamips' 'iouyap' 'vpcs' 'python-raven' 'python-aiohttp' 'python-netifaces' 'python-apache-libcloud')
conflicts=('gns3-git')
replaces=('gns3-git')
changelog=
source=("gns3-server-${pkgver}.tar.gz::https://github.com/GNS3/gns3-server/archive/v${pkgver}.tar.gz"
        "gns3-gui-${pkver}.tar.gz::https://github.com/GNS3/gns3-gui/archive/v${pkgver}.tar.gz"
        "https://github.com/GNS3/dynamips/archive/v0.2.14.tar.gz"
        "https://github.com/GNS3/iouyap/archive/0.95.tar.gz"
        "http://downloads.sourceforge.net/project/vpcs/0.6/vpcs-0.6-src.tbz"
        "https://github.com/ndevilla/iniparser/archive/master.tar.gz"
        "https://pypi.python.org/packages/source/a/aiohttp/aiohttp-0.15.1.tar.gz"
        "https://pypi.python.org/packages/source/n/netifaces/netifaces-0.10.4.tar.gz"
        "https://pypi.python.org/packages/source/r/raven/raven-5.2.0.tar.gz"
        "https://github.com/dlintott/gns3-converter/archive/v1.2.3.tar.gz"
        "https://pypi.python.org/packages/source/a/apache-libcloud/apache-libcloud-0.17.0.tar.gz"
        "https://issues.apache.org/jira/secure/attachment/12686289/libcloud.patch"
        "gns3-server@.service"
        "gns3.desktop")
md5sums=(       'b55f1af140bb8670a32561db040ec45e'
                'a1a11a5b381b976de489ef49c26749fe'
                'a7c8f358b1acfdf34fb68e1601ec44c9'
                'bcb103e450be1ddc3c3f4c31119652a4'
                'a2bd4a797cd72a357f32353f82c356e1'
                'c4fa6ed482069a9a0d4930c4760491e9'
                'd8034fcee1e9f286e811b77055688474'
                '36da76e2cfadd24cc7510c2c0012eb1e'
                'a9964f0ddf01dda0f426b215d37ee9b5'
                'ca83b0fbad203ab92533bacaf3596c20'
                'a63650261971dc82c5a6d763a2153881'
                'b210ce9e8be48b7691c9296c4e710a67'
                'f602390385890dab14f68e5e0a8cac2d'
                'ac6ba60be0a1cb7fc965d1a105e431d5')

prepare() {
        # iouyap
                cd "$srcdir/iouyap-0.95/"
                bison -ydv netmap_parse.y
                flex netmap_scan.l

        # vpcs
                cd "$srcdir/vpcs-0.6/src"
                # fix the makefile hardcoding i386
                if test "$CARCH" == x86_64; then
                        sed -i "s/i386/$CARCH/" Makefile.linux
                fi
                # fix the makefile forcing a static binary
                sed -i "s/-s -static//" Makefile.linux

        # python-apache-libcloud
                cd ${srcdir}/apache-libcloud-0.17.0
                patch -Np0 -i ../libcloud.patch

	# dynamips
		cd "$srcdir/dynamips-0.2.14"
		if [ -d "build" ]; then
                        rm -R build
                fi
                mkdir build
}

build() {
        # iniparser
                cd "$srcdir/iniparser-master"
                make

        # dynamips
		if test "$CARCH" == x86_64; then
    			export DYNAMIPS_ARCH=amd64
  		fi
		cd "$srcdir/dynamips-0.2.14/build"
                cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
                make

        # iouyap
                cd "$srcdir/iouyap-0.95"
		gcc -Wall *.c -I "${srcdir}/iniparser-master/src" -L "${srcdir}/iniparser-master" -o iouyap -liniparser -lpthread
                strip --strip-unneeded iouyap

        # vpcs
                cd "$srcdir/vpcs-0.6/src"
                make -f ./Makefile.linux
}

check() {
	# iniparser
                cd "$srcdir/iniparser-master"
                make -k check
}

package() {
	# gns3-server
	cd "$srcdir/gns3-server-${pkgver}"
        python setup.py install --root="${pkgdir}" --optimize=1
        install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/gns3-server/LICENSE"
        install -Dm644 "${srcdir}/gns3-server@.service" "${pkgdir}/usr/lib/systemd/system/gns3-server@.service"
	
	# gns3-gui
	cd "${srcdir}/gns3-gui-${pkgver}"
        python setup.py install --root="${pkgdir}" --optimize=1
        install -Dm644 "${srcdir}/gns3.desktop" "${pkgdir}/usr/share/applications/gns3.desktop"
        install -Dm644 ./resources/images/gns3_icon_256x256.png "${pkgdir}/usr/share/pixmaps/gns3.png"
        install -Dm644 ./LICENSE "${pkgdir}/usr/share/licenses/gns3-gui/LICENSE"

	# gns3-converter
	cd "${srcdir}/gns3-converter-1.2.3"
        python setup.py install --root="${pkgdir}" --optimize=1
        install -Dm644 COPYING "${pkgdir}/usr/share/licenses/gns3-converter/LICENSE"

	# dynamips
	cd "${srcdir}/dynamips-0.2.14/build"
        make DESTDIR="${pkgdir}" install
        install -Dm644 "${srcdir}/dynamips-0.2.14/COPYING" "${pkgdir}/usr/share/licenses/dynamips/COPYING"

	# iouyap
	cd "${srcdir}/iouyap-0.95"
	mv iouyap "${pkgdir}/usr/bin"
        install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/iouyap/LICENSE"

	# vpcs
	cd "$srcdir/vpcs-0.6/src"
	mv vpcs "${pkgdir}/usr/bin/"
        install -D -m 0644 "${srcdir}/vpcs-0.6/readme.txt" "${pkgdir}/usr/share/vpcs/readme.txt"
        install -D -m 0644 "${srcdir}/vpcs-0.6/COPYING" "${pkgdir}/usr/share/licenses/vpcs/COPYING"

	# python-raven
	cd "${srcdir}/raven-5.2.0"
        python setup.py install --root="${pkgdir}/" --optimize=1
        install -Dm0664 "${srcdir}/raven-5.2.0/LICENSE" "${pkgdir}/usr/share/licenses/python-raven/LICENSE"

	# python-aiohtpp
	cd "$srcdir/aiohttp-0.15.1"
        python setup.py install --root="${pkgdir}" --optimize=1 || return 1

	# python-netifaces
	cd "${srcdir}/netifaces-0.10.4"
        python setup.py install --root "${pkgdir}"
        install -Dm644 README.rst "${pkgdir}/usr/share/licenses/python-netifaces/LICENSE"

	# python-apache-libcloud
	cd ${srcdir}/apache-libcloud-0.17.0
        python setup.py install --root=${pkgdir} --optimize=1
}
