# Maintainer: 謝致邦 <Yeking@Red54.com>

pkgname=yozooffice
pkgver=2013
pkgrel=1
pkgdesc='Yozo(永中, Yongzhong) office 2013 personal without built-in JRE'
arch=('any')
url='http://www.yozosoft.com/person/'
depends=('java-runtime' 'swt')
makedepends=('java-runtime-headless')
license=('custom')
conflicts=('yozooffice-bin')
install=yozooffice.install
source=('http://www.yozosoft.com/download!download.do?productname=2013grbdeb&ipad=dx'
'yozo'
'yozooffice.install')
md5sums=('89ceb560e87f765c8ec378794bda130e'
'510f58ea0f5e5e28cd014df962a974dc'
'35bcf17ae839033a75833f5bc4bf96fc')

package() {
	cd $pkgdir
	tar -xf $srcdir/data.tar.gz
	cd usr/bin
	install -D -m755 $srcdir/yozo yozo
	install -D -m755 $srcdir/yozo yozoc
	install -D -m755 $srcdir/yozo yozoFileConvert
	install -D -m755 $srcdir/yozo yozoi
	install -D -m755 $srcdir/yozo yozop
	install -D -m755 $srcdir/yozo yozow
	cd ../local/Yozosoft/Yozo_Office
	unpack200 -r Yozo_Office.pack.gz Yozo_Office.jar
	rm -r Jre Lib *.bin *~
}
