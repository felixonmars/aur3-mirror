# Maintainer: Juan Jimenez < asdksawea@outlook.es >
pkgname=natron-bin
pkgver=1.2.1
pkgrel=1
arch=('x86_64')
pkgdesc='Video compositing software similar to Nuke and Adobe AfterEffects'
url='http://natron.inria.fr/'
license=MPL
depends=('ffmpeg')
makedepends=('p7zip')
optdepends=('blender: for 3d opencolor-io support')
conflicts=('natron' 'natron-rc' 'natron-bin-dev'  )
source=("https://bytebucket.org/triceratops2/natron-bin-64/raw/97b48114c00ad96c8cef9214973a75d3f5edc8d5/Natron-1.21.x64.tar.xz"
"https://bitbucket.org/triceratops2/natron-bin-64/src/a4590476139a0389be042d4b592312f291425140/patch.tar.xz"
)
sha256sums=('e470acdb15d7f2720a4b6636aa8211a7c3a33f7b0801f37e02bd95fa8c1e2c12'
'2394b5b4143e7d47ed2a6846dfc2f29df58caf72d914736c9ddad3c800684ad4')

prepare() {
	tar Jxvf Natron-1.21.x64.tar.xz
	tar Jxvf patch.tar.xz
}

package() {
	mkdir -p "${pkgdir}/opt/Natron-bin"
	mkdir -p "${pkgdir}/usr/share/applications"
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/usr/share/icons"
        mv -f "${srcdir}/Natron-bin" "${pkgdir}/opt/Natron-bin"﻿
			  cp -r "${srcdir}/Natron-MaintenanceTool.desktop" "${pkgdir}/usr/share/applications/"﻿
        cp -r "${srcdir}/natronIcon256_linux.png" "${pkgdir}/usr/share/icons/"
        ln -sf "${pkgdir}/opt/Natron-bin﻿/Natron" "${pkgdir}/usr/bin/Natron"
        ln -sf "${pkgdir}/opt/Natron-bin﻿/MaintenanceTool" "${pkgdir}/usr/bin/MaintenanceTool"

}
