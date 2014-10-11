# Contributor: Andrey Mivrenik <gim at fastmail dot fm>
pkgname=phpbb3-style-prosilver-se
pkgver=1.0.10
pkgrel=1
_phpbbver=3.0.12
pkgdesc='Simple grey version of prosilver with a round border for phpBB3'
arch=('any')
url='https://www.phpbb.com/customise/db/style/prosilver_special_edition/'
license=('GPLv2')
depends=("phpbb3=$_phpbbver")
source=("http://www.phpbb.com/styles/db/download/7525/prosilver_se_${pkgver}.zip")
md5sums=('1562122a4a6869c830d3be9eb7a1da66')

package() {
    install -d ${pkgdir}/usr/share/webapps/phpbb3/styles/
    cp -r $(find "$srcdir" -name 'style.cfg' -printf '%h\n') ${pkgdir}/usr/share/webapps/phpbb3/styles/
}
