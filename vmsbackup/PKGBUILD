## Maintainer: Izumi Natsuka <izmntuk@users.noreply.github.com>
pkgname=vmsbackup
pkgdesc='Utility to extract old .BCK files created on RSX/VMS'
pkgver=1.5
pkgrel=1
url='http://www.megatony.pwp.blueyonder.co.uk/tools/vmsbackup/index.htm'
depends=('gcc-libs')
license=('custom')
arch=('x86_64' 'i686')
source=('http://www.megatony.pwp.blueyonder.co.uk/tools/vmsbackup/vmsbackup.105.src.zip' LICENSE)
sha1sums=('541bdbca296165494187980208b6181c8e99d016'
          '3a58d402adbe32e886e6d37f7bb6c2cd547ee8e7')
md5sums=('498a499c950c8f8b088f274a37a30085'
         'c7793243b2ae31b4674891b1a571e967')
sha256sums=('cb083e5b608525a1ee6bcd1d66b2ea24b435d68ea1f2f8cc1375cf9946bbae78'
            '06088edf5a5260a013651df99f93a1cd922b5801088dcbe689710f672b7ab176')

build() {
	make -C vmsbackup.105.src FLAGS="-D__STDC_CONSTANT_MACROS ${CXXFLAGS} -I./"
}

package() {
	cd vmsbackup.105.src
	install -dm755 "${pkgdir}"/usr/{bin,share/{doc,licenses}/"${pkgname}"}
	install -pDm755 VMSBackup.exe "${pkgdir}/usr/bin/vmsbackup"
	install -pDm644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/DISCLAIMER"
	install -pm644 VMSBackup.txt "${pkgdir}/usr/share/doc/${pkgname}"
}
