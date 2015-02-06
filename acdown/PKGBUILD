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
		"acdown.svg"
		"AcDown.desktop"
		) 
md5sums=('f7ee0e63f04e81a3d952349fc79b25ba' 
          '971c6dec3e6abb0f12270160087a0153'
          '72090aeac14d6f04ac4a71f795fab0df'
		)

package() {
	cd ${srcdir}
        install -dm 755 ${pkgdir}/usr/{share/applications,share/acdown,bin}
        install -m 644 ${srcdir}/AcDown.sh ${pkgdir}/usr/share/acdown
        install -m 644 ${srcdir}/AcDown.exe ${pkgdir}/usr/share/acdown
        #install -m 644 ${srcdir}/logo.png ${pkgdir}/usr/share/acdown
        install -D -m 0644 ${srcdir}/acdown.svg "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/acdown.svg
        install -m 644 ${srcdir}/AcDown.desktop ${pkgdir}/usr/share/applications
        echo '#!/bin/sh' >> ${pkgdir}/usr/bin/acdown
        echo 'exec mono /usr/share/acdown/AcDown.exe "$@"' >> ${pkgdir}/usr/bin/acdown
        chmod +x ${pkgdir}/usr/bin/acdown
}


