# Maintainer: hyperfang8@gmail.com

pkgname=voidlauncher
pkgver=latest
pkgrel=1
pkgdesc="VoidLauncher for voidswrath."
arch=(any)
license=('custom')
url="http://voidswrath.com"
depends=('java-runtime' 'xorg-server-utils' 'openal')
source=('voidlauncher' 
'http://voidswrath.com/release/releases/linux/VoidLauncher.jar'
'voidlauncher.desktop' 
'voidlauncher.png')
noextract=('VoidLauncher.jar')
md5sums=('78fb758cf55a33cbf9b9a57ca3f13faa'
'SKIP'
'55af4045555be445003343febaf3afa1'
'4a4e0519aaf8e8f11117b1e3ca76afbd')

package() {
    echo 1
    install -D -m755 "${srcdir}/voidlauncher"         "${pkgdir}/usr/bin/voidlauncher"
    echo 2
    install -D -m644 "${srcdir}/VoidLauncher.jar"     "${pkgdir}/usr/share/voidlauncher/VoidLauncher.jar"
    echo 3
    install -D -m644 "${srcdir}/voidlauncher.desktop" "${pkgdir}/usr/share/applications/voidlauncher.desktop"
    echo 4
    install -D -m644 "${srcdir}/voidlauncher.png"     "${pkgdir}/usr/share/pixmaps/voidlauncher.png"
    echo 5
}
