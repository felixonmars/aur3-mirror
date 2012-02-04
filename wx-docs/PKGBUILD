# Contributor: Michal Minar <mr.mini@centrum.cz>

pkgname=wx-docs
pkgver=2.8.10
pkgrel=1
pkgdesc="Html documentation for C++ framework wxWidgets."
arch=('any')
url="http://www.wxwidgets.org/docs/"
license=('custom')
source=(lic_doc.txt
        http://downloads.sourceforge.net/project/wxwindows//Documents/$pkgver/wxWidgets-$pkgver-HTML.zip)
md5sums=('b4d931c846eff35752d1a24eeef1efdd'
         '1a92799a10e02b7ef762c016aff34905')

build() {
        mkdir -p $startdir/pkg/usr/share/licenses/wx-docs/
        install -m 644 lic_doc.txt $startdir/pkg/usr/share/licenses/wx-docs/
        cd $startdir/src/docs/mshtml/wx/ || return 1
        mkdir -p $startdir/pkg/usr/share/doc/wxWidgets/html/
        install -m 644 * $startdir/pkg/usr/share/doc/wxWidgets/html/ || return 1
}
