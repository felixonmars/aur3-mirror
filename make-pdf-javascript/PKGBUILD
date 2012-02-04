# Contributor: Andrej Gelenberg <andrej.gelenberg@udo.edu>
pkgname=make-pdf-javascript
pkgver=0.1.1
pkgrel=1
pkgdesc="make-pdf-javascript allows one to create a simple PDF document with embedded JavaScript that will execute upon opening of the PDF document"
arch=('any')
url="http://blog.didierstevens.com/programs/pdf-tools/"
license=('custom')
depends=('python')
makedeps=('hd2u')
source=("http://www.didierstevens.com/files/software/make-pdf_V0_1_1.zip")

md5sums=('9af2e343b78553021c989e8e22355531')
sha512sums=('dd6955f3dbe702e37a4c8863f3e00e882b802dd64aef9d0f9dfdb227dffee726d289b871c3a6ae36cdfeb4c8d47be7a8ebab5821bedc95a272a73036104c1b10')

build()
{
 mkdir -p $pkgdir/usr/bin/
 mkdir -p $pkgdir/usr/lib/python2.6
 cd $srcdir
 dos2unix $pkgname.py
 dos2unix mPDF.py
 python -O -c 'import mPDF'
 python -c 'import mPDF'
 cp $pkgname.py $pkgdir/usr/bin/$pkgname
 cp mPDF.py* $pkgdir/usr/lib/python2.6
}
