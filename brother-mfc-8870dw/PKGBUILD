# Maintainer: Bart Verhoeven <nepherte at archlinux dot us>
pkgname=brother-mfc-8870dw
pkgver=2.0.1
pkgrel=2
pkgdesc="CUPS driver for Brother MFC-8870DW printer"
arch=('i686' 'x86_64')
url="http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/index.html"
license=('GPL')
depends=()
if [ "$CARCH" = "x86_64" ]; then
    depends=('cups' 'ghostscript' 'gsfonts' 'foomatic-filters' 'lib32-glibc')
else
    depends=('cups' 'ghostscript' 'gsfonts' 'foomatic-filters')
fi
makedepends=('rpmextract')
install=brother-mfc-8870dw.install
source=(http://www.brother.com/pub/bsc/linux/dlf/brmfc8870dwlpr-2.0.1-1.i386.rpm
        http://www.brother.com/pub/bsc/linux/dlf/cupswrapperMFC8870DW-2.0.1-1.i386.rpm
        brother-mfc-8870dw.patch)
md5sums=('a73e6b276c35f1e61f2b8c9d3f2aa981'
         '038c3cf118ffe82c9eda5e78b80a96b4'
         '541e17ca4bcc60637f0a4e654c77b986')

build() {
  cd $srcdir

  # extract files
  rpmextract.sh brmfc8870dwlpr-2.0.1-1.i386.rpm
  rpmextract.sh cupswrapperMFC8870DW-2.0.1-1.i386.rpm

  # patch files to adhere arch packaging standard
  patch -p0 < $srcdir/brother-mfc-8870dw.patch || return 1
  
  # generate ppd and wrapper file
  $srcdir/usr/local/Brother/cupswrapper/cupswrapperMFC8870DW-2.0.1

  # put files where they belong
  mkdir -p $pkgdir/usr/share
  cp -r $srcdir/usr/bin $pkgdir/usr
  cp -r $srcdir/usr/lib $pkgdir/usr
  cp -r $srcdir/usr/local/Brother $pkgdir/usr/share/brother
  cp -r $srcdir/var $pkgdir/

  rm $pkgdir/usr/share/brother/cupswrapper/cupswrapperMFC8870DW-2.0.1
  rm $pkgdir/usr/share/brother/inf/setupPrintcap

  install -m 644 -D ppd_file "$pkgdir/usr/share/cups/model/MFC8870DW.ppd"
  install -m 755 -D wrapper  "$pkgdir/usr/lib/cups/filter/brlpdwrapperMFC8870DW"

}

