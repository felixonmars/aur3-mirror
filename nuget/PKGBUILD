# Maintainer: sgtbigman <sgtbigman [at] gmail [dot] com>
# Contributor: wenLiangcan <boxeed at gmail dot com>

pkgname=nuget
pkgver=2.8.5
pkgrel=1
pkgdesc="Package manager for .NET."
arch=('x86_64' 'i686')
url="http://www.nuget.org"
license=('Apache')
depends=('mono' 'sh')
replaces=('nuget-latest')
source=("http://nuget.org/nuget.exe"
        "${pkgname}")
md5sums=('c0888dc1e2c4da4e621719a69e1cc0d2'
         '7d52a5ad1c8ba770f57940457c26644f')
install="${pkgname}.install"

build() {
	cd "${srcdir}"
}

package() {
	install -Dm755 "${pkgname}.exe" "${pkgdir}/opt/${pkgname}/${pkgname}.exe"
	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
