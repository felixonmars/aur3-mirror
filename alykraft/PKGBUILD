# Maintainer: Felix Yadomi <dev.yadomi@gmail.com>
pkgname=alykraft
pkgver=1.5
pkgrel=2
epoch=0
pkgdesc="Lanceur minecraft de la communauté Alyrkaft"
arch=(any)
url="http://alykraft.fr"
license=('unknown')
depends=('java-runtime' 'xorg-server-utils' 'openal')
source=($pkgname
	$pkgname.jar::http://dl.dropbox.com/u/57476000/new/Alykraft.jar
	$pkgname.desktop)
noextract=($pkgname.jar)
md5sums=('57c98e45d45dcf9e83416d65bf100ab2'
         '7cdb73d41bac5517dec136b8fc0bef4b'
         'f280f479014fe8184cd665a0988016d7')
package() {
	install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
	install -Dm644 $pkgname.jar "$pkgdir"/usr/share/$pkgname/$pkgname.jar
    desktop-file-install $pkgname.desktop --dir "$pkgdir"/usr/share/applications/
    bsdtar -xf $pkgname.jar res/favicon.png
    install -Dm644 res/favicon.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
}
