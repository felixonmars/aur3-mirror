# Maintainer: Milos Pejovic <pejovic@gmail.com>
# Contributor: Juan Miguel Cejuela <jmcejuela@gmail.com>
pkgname=processing
pkgver=1.5.1
pkgrel=1
pkgdesc="Programming language and environment for programming images, animation, and interactions"
arch=('any')
url="http://www.processing.org/"
license=('GPL' 'LGPL')
depends=('libgl' 'libxxf86vm')
optdepends=('lib32-libxtst: for x86_64 systems')
options=(!strip)
install=processing.install
source=(http://processing.googlecode.com/files/processing-$pkgver-linux.tgz
        http://wiki.processing.org/skins/processingskin/processing_wiki_logo.png
        processing.desktop)
md5sums=('a4539860c7d55b650c7e2f5ba5fdeac9'
         '1807b17245cf9b82867e0b285a0c4b9c'
         '120270aecd8996edf6a3f878877bbf35')

build() {
    cd $srcdir/$pkgname-$pkgver

    install -d "$pkgdir/usr/share/processing/"
    cp -r ./* "$pkgdir/usr/share/processing/"

    chmod a+x "$pkgdir/usr/share/processing/processing"
    install -d "$pkgdir/usr/bin/"
    ln -s /usr/share/processing/processing "$pkgdir/usr/bin/processing"
    
    install -m644 "$srcdir/processing_wiki_logo.png" "$pkgdir/usr/share/processing/processing.png"
    
    install -D -m644 "$srcdir/processing.desktop" "$pkgdir/usr/share/applications/processing.desktop"
}
