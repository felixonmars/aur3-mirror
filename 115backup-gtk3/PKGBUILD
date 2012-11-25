# Contributor: limser <echo bGltc2VyQHFxLmNvbQo=|base64 -d>

pkgname=115backup-gtk3
_pkgname=115backup
pkgver=1.0.0
pkgrel=1
pkgdesc='115backup with gtk3'
url='http://pc.115.com'
arch=('i686' 'x86_64')
license=('unknown')
depends=('gtkmm3')
optdepends=('nautilus: drag your files')
conflicts=('115backup-gtk2')

if [ "$CARCH" = "i686" ]; then
	source=("http://pc.115.com/download/linux/${_pkgname}_v${pkgver}_gtk3_32.deb")
    md5sums=('8713ae4a4ca6a093adbff65ddde8db0c')
elif [ "$CARCH" = "x86_64" ]; then
	source=("http://pc.115.com/download/linux/${_pkgname}_v${pkgver}_gtk3_64.deb")
	md5sums=('e07d501ccd3e936111afcf8b2ca10522')
fi

package(){
	cd ${srcdir}
    tar azxvf data.tar.gz -C ${pkgdir}
}
