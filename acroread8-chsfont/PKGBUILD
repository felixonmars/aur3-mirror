# Contributor: leafduo <leafduo@gmail.com>

pkgname=acroread8-chsfont
pkgver=8.1.2
pkgrel=1
pkgdesc="Chinese Simplified font pack for for Adobe Acrobat Reader 8.1.2"
url="http://www.adobe.com/products/acrobat/acrrasianfontpack.html"
depends=('acroread>=8.1.2')
source=("http://ardownload.adobe.com/pub/adobe/reader/unix/8.x/8.1.2/misc/FontPack81_chs_i486-linux.tar.gz")
arch=(i686 x86_64)
license=('custom')
md5sums=('aecf224011045271ff8eac0fbb50c725')

build() {
    mkdir -p $startdir/pkg/usr/lib/acroread/
    cd $startdir/src/
    tar xzf FontPack81_chs_i486-linux.tar.gz
    cd CHSKIT
    tar xf BINCOM.TAR
    tar xf LANGCHS.TAR
    tar xf LANGCOM.TAR
    rm $startdir/src/CHSKIT/Adobe/Reader8/Reader -r
    rm $startdir/src/CHSKIT/Adobe/Reader8/Resource/CMap/Identity-[HV]
    mv $startdir/src/CHSKIT/Adobe/Reader8/* $startdir/pkg/usr/lib/acroread/
}
