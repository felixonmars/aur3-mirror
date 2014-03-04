# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: G_Syme <demichan@mail.upb.de>
# Contributor: Jose Valecillos <valecillosjg@gmail.com>

pkgname=violet
pkgver=2.0.1
pkgrel=1
pkgdesc="A UML editor for quickly producing simple UML diagrams (also an Eclipse plugin)"
arch=(any)
url=http://violet.sourceforge.net
license=(GPL2)
depends=(desktop-file-utils hicolor-icon-theme java-runtime)
install=$pkgname.install
source=($pkgname-$pkgver.jar::http://downloads.sourceforge.net/project/$pkgname/violetumleditor/$pkgver/violetumleditor-$pkgver.jar
    $pkgname.desktop
    $pkgname-96x96.png
    $pkgname.sh)
noextract=($pkgname-$pkgver.jar)
sha256sums=('2bf552cbf99b5281cd134606dff2b14682728bd9b80d064aa86808595ec8ae40'
    'e110f5c6ab982d9f4eafbe0243de382248b260f338fd8d7eb2617320a4b87377'
    '809abd8b261f064068079f27634bc1c9cd995f4fe003327e983e278aaf3aa4c1'
    '7c0ffc1a1eacf27eb22fac537427b517d852f123bdd930a76f5d90d2c5898737')
sha512sums=('a5845eb6dfec5eee387bfc4c95e90e6265241e050d365f457c58859a83c4cef394f567dea0facb6fc525da83d5131b09c085a16f8442f636c041e8e8c2673fa6'
    '0a48c8ca546200a19587d988e02e7fc6ed6197584255597f9c08269cfec5a94fe2e84527fa7f8c968214479c40d17cfb1ecc5add62fa265a9a07ca50edd1e477'
    '6a31500df821b80a782533a8777adadde8d7535b7303ae13f6b9ba0646c90a2e5384ec95a32dda5e04e3d81dd74659e9b33c444a350526be28ef0b92ae775e6e'
    '71be950083679503ad827596b32e74804a1d2797468b9ffec47e4ede61ea8f89e14469f0a77ba97bbbe886f570b3a1e9803a165866a9c6addcb72977aae0fce5')

package() {
    install -Dm644 $pkgname-$pkgver.jar "$pkgdir"/usr/share/java/$pkgname/$pkgname.jar
    install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/$pkgname
    install -d "$pkgdir"/opt/eclipse/plugins/
    ln -s /usr/share/java/$pkgname/$pkgname.jar "$pkgdir"/opt/eclipse/plugins/com.horstmann.$pkgname-$pkgver.jar

    desktop-file-install $pkgname.desktop --dir "$pkgdir"/usr/share/applications/
    install -Dm644 $pkgname-96x96.png "$pkgdir"/usr/share/icons/hicolor/96x96/apps/$pkgname.png
    install -dm755 "$pkgdir"/usr/share/pixmaps/
    ln -s /usr/share/icons/hicolor/96x96/apps/$pkgname.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
}
