# Maintainer: flow

pkgname=copy
pkgver=1.45.0363
pkgrel=1
pkgdesc="A free service that lets you bring your photos, docs, and videos anywhere and share them easily. Get 15 GB of FREE"
arch=("i686" "x86_64")
url="https://www.copy.com"
license=(custom)
depends=("qt4")
optdepends=()
conflicts=("")
options=('!strip')
md5sums=('25e58fbc3371992e11886b5d15363d5b'
         'b6254313dfc0dab818026c15972ad45f'
         '0d2a1165a83e29c0f11312f7a7f952e5')

source=("https://copy.com/install/linux/Copy.tgz" "copy.png" "copy.desktop")

package() {
	install -d "$pkgdir"/opt
    [[ "$CARCH" == "x86_64" ]] && cp -R "$srcdir"/${pkgname}/x86_64/ "$pkgdir"/opt/${pkgname}
    [[ "$CARCH" == "i686" ]] && cp -R "$srcdir"/${pkgname}/x86/ "$pkgdir"/opt/${pkgname}

	find "$pkgdir"/opt/${pkgname}/ -type f -exec chmod 644 {} \;
	chmod 755 "$pkgdir"/opt/${pkgname}/CopyAgent
	chmod 755 "$pkgdir"/opt/${pkgname}/CopyCmd
	chmod 755 "$pkgdir"/opt/${pkgname}/CopyConsole

	install -d "$pkgdir"/usr/bin
	ln -s ../../opt/${pkgname}/CopyAgent "$pkgdir"/usr/bin/${pkgname}agent
	ln -s ../../opt/${pkgname}/CopyCmd "$pkgdir"/usr/bin/${pkgname}cmd
	ln -s ../../opt/${pkgname}/CopyConsole "$pkgdir"/usr/bin/${pkgname}Console

	install -Dm644 "$srcdir"/${pkgname}.desktop "$pkgdir"/usr/share/applications/${pkgname}.desktop
	install -Dm644 "$srcdir"/${pkgname}.png "$pkgdir"/usr/share/pixmaps/${pkgname}.png

}

