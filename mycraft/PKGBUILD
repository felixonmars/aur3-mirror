# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Maxence Sartiaux <makz@sartiaux.be>

pkgname=mycraft
pkgver=5.1.1
pkgrel=1
pkgdesc="Official minecraft launcher for mycraft.fr"
arch=(any)
url=http://www.mycraft.fr/
license=(custom)
depends=(java-runtime openal ttf-dejavu xorg-server-utils)
install=$pkgname.install
source=($pkgname
    $pkgname.jar::https://dl.dropbox.com/u/28045671/myCraft/myCraft.jar
    $pkgname.desktop
    $pkgname.install
    https://dl.dropbox.com/u/3395784/$pkgname.png)
noextract=($pkgname.jar)
sha256sums=('0a446dba7812c0f9e968b4be616f06a60a9b69b4f12165b47d41505936b90581'
    '728bf6538b07ef73334b9e2649cf5ef1c6b6d5667c399b1081d1d406f840954f'
    'bf697e47c5a1c3483df49a8e801ee58203f173bc1156551372601e1cbc7a6f4c'
    '5bfc009991e260b2c03df49ebc9ad7f0de487d9822b336d68ce4150d288370c8'
    'd47d645ef4e73119b313d532d406656d442ad07123ebe2e699db2da15bfc11ce')
sha512sums=('77642aa90752f9102c23bf3049d99c6a80101ecf9f2be05a8d7ceafba41834fe73e3097f0c278e6f219eceee62409e62549f6907ced41dc7440e2d9144c6d8b7'
    '6a01c9add8c3f2f4f6c5c9d4a81ba4178fb2fe88e0ad4cc8e410567df3ff8670dae6fdc89cff9a704596498b709e2b20e94cf3e84806744decfa6a25d6c8079d'
    '1acee57e01cf9801dc51430c552c97e042e8ba00d0b50ae298748cf2cf18dd439325b0a6c9ab3d6838e298657145220b030ec86724e10873ab9a93e99f41807f'
    '8342bd0377145622ca9e952c4d077c43bdc4a742c33d541b7ee2e4a2965bca79accd898696e5554ddab2e8a96cd88c6e56fd13c681eefbdc55f1500d591f40f5'
    '3eedfc034e7ac258b46aeaa89e8efdb0730fac12a06e44ac08d802186ff4c946073c3ea8430ed023b2cfa2cd299c16a790baf04137932dd890b761eec39576b8')

package() {
    install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
    install -Dm644 $pkgname.jar "$pkgdir"/usr/share/$pkgname/$pkgname.jar
    install -Dm644 $pkgname.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
    desktop-file-install $pkgname.desktop --dir "$pkgdir"/usr/share/applications/
}
