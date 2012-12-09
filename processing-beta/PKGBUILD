# Maintainer: Jiehan Zheng <zheng@jiehan.org>
# Contributor: Milos Pejovic <pejovic@gmail.com>
# Contributor: Juan Miguel Cejuela <jmcejuela@gmail.com>
pkgname=processing-beta
pkgver=2.0b7
pkgrel=1
pkgdesc="Programming language and environment for programming images, animation, and interactions"
arch=('i686' 'x86_64')
url="http://processing.org/"
license=('GPL' 'LGPL')
depends=('libgl' 'libxxf86vm')
optdepends=('lib32-libxtst: for x86_64 systems')
conflicts=("processing")
options=('!strip')
install=processing.install

case "$CARCH" in
    i686|i[3-5]86) _source_arch='86';;
    x86_64|amd64) _source_arch='64';;
    *) error "Unknown or invalid CARCH=$CARCH"; exit 1
esac

source=(http://processing.googlecode.com/files/processing-${pkgver}-linux${_source_arch}.tgz
        http://wiki.processing.org/skins/processingskin/processing_wiki_logo.png
        processing.desktop)
md5sums=('b616dde6b28cb436b78363866aa7db02'
         '1807b17245cf9b82867e0b285a0c4b9c'
         '120270aecd8996edf6a3f878877bbf35')
[ "${_source_arch}" = '64' ] && md5sums[0]='2e7d4ad7f0e128d9bc456c2f6bd3b00f'

build() {
    cd $srcdir/processing-$pkgver

    install -d "$pkgdir/usr/share/processing/"
    cp -r ./* "$pkgdir/usr/share/processing/"

    chmod a+x "$pkgdir/usr/share/processing/processing"
    install -d "$pkgdir/usr/bin/"
    ln -s /usr/share/processing/processing "$pkgdir/usr/bin/processing"
    
    install -m644 "$srcdir/processing_wiki_logo.png" "$pkgdir/usr/share/processing/processing.png"
    
    install -D -m644 "$srcdir/processing.desktop" "$pkgdir/usr/share/applications/processing.desktop"
}
