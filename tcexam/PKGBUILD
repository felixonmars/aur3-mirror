# Maintainer: Zsolt Udvari <udvzsolt@gmail.com>
pkgname=tcexam
pkgver=11.2.023
pkgrel=1
epoch=
pkgdesc="System for electronic exams - Computer-Based Assessment"
arch=(any)
url="http://www.tcexam.org/"
license=('GPL3')
depends=("php")
optdepends=()
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/${pkgname}_11_2_023.zip)
md5sums=('f50a099a865f8b7156a76ef87faac954')
install=tcexam.install

package() {
    cd $srcdir/TCExam

    install -m 755 -d $pkgdir/srv/http/tcexam
    install -m 755 -d $pkgdir/usr/share/doc/tcexam
    
    cp -r admin cache fonts images install public shared favicon.ico index.php \
        $pkgdir/srv/http/tcexam
    install CHANGELOG.TXT {,LATEX_}README.TXT TRANSLATORS.TXT \
        $pkgdir/usr/share/doc/tcexam

    chown -R http $pkgdir/srv/http/tcexam/shared/config
}

