# Maintainer: Juan Jimenez < asdksawea@outlook.es >
pkgname=natron-bin-dev
pkgver=2.0
pkgrel=1
arch=('x86_64')
pkgdesc='Video compositing software similar to Nuke and Adobe AfterEffects'
url='http://natron.inria.fr/'
license=MPL
depends=('ffmpeg')
makedepends=('p7zip')
optdepends=('blender: for 3d opencolor-io support')
conflicts=('natron' 'natron-rc' 'natron-bin'  )
source=("https://bytebucket.org/triceratops2/natron-bin-64/raw/97b48114c00ad96c8cef9214973a75d3f5edc8d5/beta.tar.xz"
"https://bitbucket.org/triceratops2/natron-bin-64/src/a4590476139a0389be042d4b592312f291425140/patch.tar.xz"
)
sha256sums=('a1268115534c9be0d19a074b0fb3bbc22213696edb9300cd42dcb6e1f25c18f0'
'7e792042459ed5ce3e803f417a5c6dfb9bf7222e71a205ab00250b5d51721109')

prepare() {
	tar Jxvf beta.tar.xz
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
