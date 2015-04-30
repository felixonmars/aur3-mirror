# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname=vscode
pkgver=0.1.0
pkgrel=1
license=('custom')
pkgdesc='A cross-platform IDE by Microsoft'
arch=("i386" "x86_64")
url='https://github.com/KnightOS/genkfs'
source=(
	"http://download.microsoft.com/download/0/D/5/0D57186C-834B-463A-AECB-BC55A8E466AE/VSCode-linux-x64.zip"
	"vscode.sh"
	"vscode.desktop"
)
noextract=("VSCode-linux-x64.zip")
sha1sums=('47ca16f0dafe423174eae9c5db6252584e8c6914'
          '4590bb220be19d69c3aa08e765487aa07553ff1c'
          'a2001b3288e0b47bf231b9f3c78b40b977fe8202')

prepare() {
	cd "${srcdir}"
	mkdir -p "${pkgname}"
	bsdtar -C "${pkgname}" -xf VSCode-linux-x64.zip
}

package() {
	cd "${srcdir}"

	install -d "${pkgdir}/opt"
	cp -R vscode/ "${pkgdir}/opt"
	find "${pkgdir}/opt/vscode/" -type f | xargs chmod 644
	chmod +x "${pkgdir}/opt/vscode/Code"

	install -Dm755 "$srcdir/vscode.sh" "$pkgdir/usr/bin/vscode"
	install -Dm644 "${srcdir}/${pkgname}.desktop" \
		"${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
