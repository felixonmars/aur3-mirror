# Maintainer: Hoang Duc Hieu <arch@zahe.me>
# Maintainer: Hoang Minh Thang <hoangminhthang@ktqd.org>
_extname=b2uconverter
pkgname=libreoffice-extension-$_extname
pkgver=10.01.4
pkgrel=1
pkgdesc="LibreOffice extension to convert documents from old Vietnamese encodings to Unicode."
arch=('any')
url=http://extensions.libreoffice.org/extension-center/$_extname
license=('LGPL2.1')
groups=('libreoffice-extensions')
depends=('libreoffice-common')
source=("http://extensions.libreoffice.org/extension-center/b2uconverter/releases/10.01.4/b2uconverter-10.01.4.oxt")
md5sums=('0804e894056313b1d637392fcfb61f69')

package() {
    mkdir -p ${pkgdir}/usr/lib/libreoffice/share/extensions/$_extname
    rm ${srcdir}/b2uconverter-10.01.4.oxt
    mv ${srcdir}/* ${pkgdir}/usr/lib/libreoffice/share/extensions/$_extname
}
