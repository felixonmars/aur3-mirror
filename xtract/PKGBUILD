# Maintainer: IgnorantGuru <ignorantguru@users.sourceforge.net>
pkgname=xtract
pkgver=1.1.0
pkgrel=3
pkgdesc="Decompresses and extracts archives - designed for file manager integration"
arch=(any)
optdepends=('zenity' 'gzip' 'xz-utils' 'unzip' 'bzip2' 'p7zip' 'unrar' 'sudo' 'gksu')
license=('GPL3')
url=("http://igurublog.wordpress.com/downloads/script-$pkgname/")
source=("http://downloads.sourceforge.net/project/ig-scripts/$pkgname-$pkgver.sh")
#md5sums=(`wget -O - http://downloads.sourceforge.net/project/ig-scripts/$pkgname-$pkgver.sh | md5sum | head -c 32`)
md5sums=('6f5fe977cf0f0a1cba482a8c8d079432')
sha256sums=('dc15bc2b842f33cace3246488b823c4a855a73ef64f9251403b6c4eb11041f2d')

build() {
    install -Dm755 "$srcdir/$pkgname-$pkgver.sh" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$srcdir/../$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
