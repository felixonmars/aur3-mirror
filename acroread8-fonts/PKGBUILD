# Contributor: Lee.MaRS <leemars@gmail.com>

pkgname=acroread8-fonts
pkgver=8.1.2
pkgrel=2
pkgdesc="Chinese Simplified, Chinese Traditional, Japanese, Korean and Extended font packs for Adobe Acrobat Reader 8.1.2"
url="http://www.adobe.com/products/acrobat/acrrasianfontpack.html"
depends=('acroread>=8.1.2')
source=("http://ardownload.adobe.com/pub/adobe/reader/unix/8.x/8.1.2/misc/FontPack81_chs_i486-linux.tar.gz" \
        "http://ardownload.adobe.com/pub/adobe/reader/unix/8.x/8.1.2/misc/FontPack81_cht_i486-linux.tar.gz" \
	"http://ardownload.adobe.com/pub/adobe/reader/unix/8.x/8.1.2/misc/FontPack81_jpn_i486-linux.tar.gz" \
	"http://ardownload.adobe.com/pub/adobe/reader/unix/8.x/8.1.2/misc/FontPack81_kor_i486-linux.tar.gz" \
	"http://ardownload.adobe.com/pub/adobe/reader/unix/8.x/8.1.2/misc/FontPack81_xtd_i486-linux.tar.gz")
arch=(i686 x86_64)
license=('custom')
md5sums=('aecf224011045271ff8eac0fbb50c725'
         '72f6ed7b92ffc4797cb8d6d88e271b5e'
         '56d631775fb7ae3eb7e3247f8f1ca786'
         '5206b5344fb9d8b5a4cf3e133f588c7c'
         'f916ae607eb755b56001c6af2374d462')

build() {
        mkdir -p $startdir/pkg/usr/lib/acroread/
	cd $startdir/pkg/usr/lib/acroread/
	find $startdir/src -name LANG\*.TAR -exec tar -xf {} \;
	mv Adobe/Reader8/Resource .
	rm -rf Adobe
	rm -f Resource/CMap/Identity-[HV]
}
