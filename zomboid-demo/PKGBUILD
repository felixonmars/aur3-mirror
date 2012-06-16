# Contrib: kevku <kevku@gmx.com>
pkgname=zomboid-demo
pkgver=0.1.4c
pkgrel=2
pkgdesc="Project Zomboid Pre-Alpha Tech Demo"
arch=('x86_64' 'i686')
url="http://projectzomboid.com"
license=('custom')
depends=('java-runtime' 'lwjgl')
makedepends=('unzip' 'imagemagick')
source=('http://www2.fileplanet.com/images/220000/220702ss_sm2.jpg'
        'zomboid-demo'
        'zomboid-demo.desktop')
md5sums=('8b7398de77aa3270fc07753aafa2823d'
         '2fd3bc1e1e66b794db4e96a83b03d976'
         '4702cfb007bcd1ed422bb2e9292d2867')

package() {
  cd "$srcdir/"
    _src="http://www.fileplanet.com/220702/download/Project-Zomboid-Pre-Alpha-Tech-Demo"
    _url=$(curl "$_src" | grep -m 1 -o "http.*zip")
    curl -L -o "ProjectZomboid-PublicTechDemo_0_1_4c-batchfix.zip" -e "$_src" "$_url"    
    md5sum -c - <<- EOF
	84d3ec972fe2a82c3ab10852f8fd753a  ProjectZomboid-PublicTechDemo_0_1_4c-batchfix.zip
		EOF
    unzip ProjectZomboid-PublicTechDemo_0_1_4c-batchfix.zip
    install -Dm644 zombie.jar "$pkgdir/usr/share/java/zomboid-demo/zombie.jar"
    install -Dm755 zomboid-demo "$pkgdir/usr/bin/zomboid-demo"
    install -Dm644 zomboid-demo.desktop "$pkgdir/usr/share/applications/zomboid-demo.desktop"
    convert 220702ss_sm2.jpg zomboid-demo.png
    install -Dm644 zomboid-demo.png "$pkgdir/usr/share/pixmaps/zomboid-demo.png"
}

# vim:set ts=2 sw=2 et:
