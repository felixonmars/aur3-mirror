# Maintainer : maz-1 <loveayawaka at gmail dot com>


pkgname=acdown
pkgver=4.5.8
pkgrel=1
pkgdesc="Online video downloader that can grab resources from over a hundred websites. "
arch=('any')
url="http://acdown.codeplex.com"
license=('apache')
depends=('mono'
		)
source=("AcDownForLinux.zip::http://download-codeplex.sec.s-msft.com/Download/Release?ProjectName=acdown&DownloadId=945957&FileTime=130612239996800000&Build=20959"
		"logo.png"
		"AcDown.desktop"
		) 
md5sums=('f7ee0e63f04e81a3d952349fc79b25ba' 
          '7a95d2fea582c1f02df04061d50af299'
          'eeb36a83178df879dc0c942be5384a9d'
		)

package() {
	cd ${srcdir}
        install -dm 755 ${pkgdir}/usr/{share/applications,share/acdown,bin}
        install -m 644 ${srcdir}/AcDown.sh ${pkgdir}/usr/share/acdown
        install -m 644 ${srcdir}/AcDown.exe ${pkgdir}/usr/share/acdown
        install -m 644 ${srcdir}/logo.png ${pkgdir}/usr/share/acdown
        install -m 644 ${srcdir}/AcDown.desktop ${pkgdir}/usr/share/applications
        echo '#!/bin/sh' >> ${pkgdir}/usr/bin/acdown
        echo 'exec mono /usr/share/acdown/AcDown.exe "$@"' >> ${pkgdir}/usr/bin/acdown
        chmod +x ${pkgdir}/usr/bin/acdown
}


