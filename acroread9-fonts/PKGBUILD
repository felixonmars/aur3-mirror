# Contributor: Lee.MaRS <leemars@gmail.com>

pkgname=acroread9-fonts
pkgver=9.1.0
pkgrel=2
pkgdesc="Chinese Simplified, Chinese Traditional, Japanese, Korean and Extended font packs for Adobe Acrobat Reader 9.1.0"
url="http://www.adobe.com/products/acrobat/acrrasianfontpack.html"
[ $CARCH == i686 ] && depends=('acroread>=9.1.0')
[ $CARCH == x86_64 ] && depends=('bin32-acroread>=9.1.0')
source=("http://ardownload.adobe.com/pub/adobe/reader/unix/9.x/9.1/misc/FontPack910_chs_i486-linux.tar.bz2" \
        "http://ardownload.adobe.com/pub/adobe/reader/unix/9.x/9.1/misc/FontPack910_cht_i486-linux.tar.bz2" \
	"http://ardownload.adobe.com/pub/adobe/reader/unix/9.x/9.1/misc/FontPack910_jpn_i486-linux.tar.bz2" \
	"http://ardownload.adobe.com/pub/adobe/reader/unix/9.x/9.1/misc/FontPack910_kor_i486-linux.tar.bz2" \
	"http://ardownload.adobe.com/pub/adobe/reader/unix/9.x/9.1/misc/FontPack910_xtd_i486-linux.tar.bz2")
arch=(i686 x86_64)
license=('custom')
md5sums=('8abe3f7fb77918a8376b6793b841eaab'
         '38baee4eca2d8291220eb8a8ab77f9b7'
         'b681807c0b8a34c76ec894675d98ec77'
         '76a3dd2511d82c9dc1556bb0f0eae6c1'
         'a2de87858345cf3b2199d4a2fe424b65')

[ $CARCH == i686 ] && _prefix='/usr/lib/acroread/'
[ $CARCH == x86_64 ] && _prefix='/opt/acrobat/'

build() {
        mkdir -p $pkgdir/$_prefix
	cd $pkgdir/$_prefix
	find $srcdir -name LANG\*.TAR -exec tar -xvf {} \;
	mv Adobe/Reader9/Resource .
	rm -rf Adobe
	rm -f Resource/CMap/Identity-[HV]
}
