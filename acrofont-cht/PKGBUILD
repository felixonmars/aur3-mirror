# Contributor: Jesse Lee <joyli@vip.url.com.tw>

pkgname=acrofont-cht
pkgver=9.1
pkgrel=1
pkgdesc="Traditional Chinese font packs for Adobe Acrobat Reader 9.1"
arch=('any')
url="http://www.adobe.com/products/acrobat/acrrasianfontpack.html"
license=('custom')
depends=('acroread>=9.1.0')
source=("ftp://ftp.adobe.com/pub/adobe/reader/unix/9.x/9.1/misc/FontPack910_cht_i486-linux.tar.bz2")
md5sums=('38baee4eca2d8291220eb8a8ab77f9b7')


package() {
    mkdir -p $pkgdir/opt/acrobat/Resource
    cd $pkgdir/opt/acrobat/Resource
    find $srcdir -name LANG\*.TAR -exec tar -xf {} \;
    rm -f CMap/Identity-[HV]
}
