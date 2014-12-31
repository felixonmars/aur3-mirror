# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
# Contributor : Paul Burton <paulburton89@gmail.com>
pkgname=via-chrome9-dkms
pkgver=92.008.d9c5be.20140915
pkgrel=1
pkgdesc="VIA chrome9 DRM/KMS driver"
arch=('i686' 'x86_64')
url="http://linux.via.com.tw"
license=('custom')
depends=('dkms' 'linux-headers>=3.4')
provides=('via-chrome9')
conflicts=('via-chrome9')
install=${pkgname}.install
source=('5.76.52.92-sourcecode-008-d9c5be-20140915.7z::http://linux.via.com.tw/support/beginDownload.action?eleid=741&fid=1041'
        'dkms.conf'
        'via_chrome9_irq.c.patch'
        'via_chrome9_reloc.c.patch')        
md5sums=('f02433a9573ee07db0acc5723f75d8a3'
         'c36f397e2953311316453af08605e757'
         '054bf39ba3cb8e7cd53b4f81940f5523'
         '840d77f45437d04e5f27d258c5cb2de6')
_dir=5.76.52.92-sourcecode-008-d9c5be-20140915/TTM/3.4.0-3.x.x/via_chrome9_ttm

prepare() {
  cd $srcdir/$_dir
  patch -p0 --verbose -i $srcdir/via_chrome9_irq.c.patch
  patch -p0 --verbose -i $srcdir/via_chrome9_reloc.c.patch  
}

build() {
  cd $srcdir/$_dir

	# move cbios under the driver directory
	mv "../../cbios/" .
	sed -i 's|\.\./\.\./cbios|cbios|' Makefile

	# patch for kernel version
	#patch -p1 <"${srcdir}/via-chrome9-kernel38.patch"

	# extract license
	sed -n '/Copyright/,/DEALINGS IN THE SOFTWARE/p' via_chrome9_drm.c | sed 's/^ \* *//' >"${srcdir}/LICENSE"
}

package() {
  cd $srcdir/$_dir

	# install source
	install -dm 755 "${pkgdir}/usr/src/via-chrome9-${pkgver}"
	cp -a * "${pkgdir}/usr/src/via-chrome9-${pkgver}/"

	# install dkms configuration
	cp "$srcdir/dkms.conf" "${pkgdir}/usr/src/via-chrome9-${pkgver}/"

	# blacklist viafb
	install -dm 755 "${pkgdir}/usr/lib/modprobe.d"
	echo "blacklist viafb" >"${pkgdir}/usr/lib/modprobe.d/viafb.conf"

	# set permissions
	find "${pkgdir}" -type d -exec chmod 755 {} +
	find "${pkgdir}" -type f -exec chmod 644 {} +

	# install license
	install -dm755 "${pkgdir}/usr/share/licenses/via-chrome9-dkms"
	install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/via-chrome9-dkms"
}
