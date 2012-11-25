# Contributor: limser <echo bGltc2VyQHFxLmNvbQo=|base64 -d>

pkgname=115backup-gtk2
_pkgname=115backup
pkgver=1.0.0
pkgrel=1
pkgdesc='115backup with gtk2'
url='http://pc.115.com'
arch=('i686' 'x86_64')
license=('unknown')
depends=('gtkmm')
optdepends=('nautilus: drag your files')
conflicts=('115backup-gtk3')

if [ "$CARCH" = "i686" ]; then
	source=("http://pc.115.com/download/linux/${_pkgname}_v${pkgver}_gtk2_32.deb")
    md5sums=('178656718fb5278eac7f1441e40ddfcf')
elif [ "$CARCH" = "x86_64" ]; then
	source=("http://pc.115.com/download/linux/${_pkgname}_v${pkgver}_gtk2_64.deb")
	md5sums=('5047c401cc70cf74282fdeeca466a83e')
fi

package(){
	cd ${srcdir}
    tar azxvf data.tar.gz -C ${pkgdir}
}
