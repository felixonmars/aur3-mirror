# Contributor: Lukas Martinelli <me@lukasmartinelli.ch>

pkgname=docksend
pkgver=0.7
pkgrel=1
pkgdesc='Send docker commands to remote host and sync back captured output and modified files'
arch=('any')
depends=('rsync' 'openssh')
license=('MIT')
url="https://github.com/lukasmartinelli/docksend"
source=("https://github.com/lukasmartinelli/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('98f6c29f6c9f8fd227ab86cd634eb12a55ea82345941d103013a305dea357b39')

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname".sh "$pkgdir/usr/bin/$pkgname"
}

