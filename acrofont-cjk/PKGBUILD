# Contributor: Jesse Lee <joyli@vip.url.com.tw>

pkgname=acrofont-cjk
pkgver=7.0.8
pkgrel=1
pkgdesc="CJK font packs for Adobe Acrobat Reader 7.0.8"
url="http://www.adobe.com/products/acrobat/acrrasianfontpack.html"
depends=('acroread>=7.0.8')
source=("ftp://ftp.adobe.com/pub/adobe/reader/unix/7x/7.0.8/misc/FontPack708_chs_i386-linux.tar.gz"\
        "ftp://ftp.adobe.com/pub/adobe/reader/unix/7x/7.0.8/misc/FontPack708_cht_i386-linux.tar.gz"\
	"ftp://ftp.adobe.com/pub/adobe/reader/unix/7x/7.0.8/misc/FontPack708_jpn_i386-linux.tar.gz"\
	"ftp://ftp.adobe.com/pub/adobe/reader/unix/7x/7.0.8/misc/FontPack708_kor_i386-linux.tar.gz")

md5sums=('4571e19adbe7202b7593f337742eeef3'\
         '8dff8bbeaa4c679655784263882f0f87'\
         'b0bd286409a4bcf34c831fe41c208370'\
         '045fbc3eb8f38da5e1aeec326fdedaa0')

build() {
        mkdir -p $startdir/pkg/opt/acrobat/Resource
	cd $startdir/pkg/opt/acrobat/Resource
	find $startdir/src -name LANG\*.TAR -exec tar -xf {} \;
	rm -f CMap/Identity-[HV]
}
