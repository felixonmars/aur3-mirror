# Maintainer: wenLiangcan <boxeed at gmail dot com>

pkgname=nuget-nomd5check
pkgnamebin=nuget
pkgver=2.8.50926.602
pkgrel=1
pkgdesc="Package manager for .NET."
arch=('x86_64' 'i686')
url="http://www.nuget.org"
license=('Apache')
depends=('mono' 'sh')
source=("http://nuget.org/nuget.exe"
        "${pkgnamebin}")
md5sums=('SKIP'
         '7d52a5ad1c8ba770f57940457c26644f')
install="${pkgnamebin}.install"

build() {
	cd "${srcdir}"
}

package() {
	install -Dm755 "${pkgnamebin}.exe" "${pkgdir}/opt/${pkgnamebin}/${pkgnamebin}.exe"
	install -Dm755 "${pkgnamebin}" "${pkgdir}/usr/bin/${pkgnamebin}"
}
