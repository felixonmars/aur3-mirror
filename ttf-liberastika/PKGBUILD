# Contributor: Roman Timushev <romikt@gmail.com>
# Maintainer : Robert Boles <lakeconnection@outlook.com>

pkgname=ttf-liberastika
pkgver=1.1.3
pkgrel=4
pkgdesc="Liberastika fonts based on Liberation Sans family with Cyrillic part redesigned"
arch=('any')
license=('GPL2')
url="http://code.google.com/p/liberastika/"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=$pkgname.install
source=(http://liberastika.googlecode.com/files/liberastika-ttf-${pkgver}.zip)
md5sums=('b9a4c36e3e050a8613220c55228287be')

package()
{
        cd "$srcdir"
        install -d "$pkgdir/usr/share/fonts/TTF/"
        install -m644 *.ttf "$pkgdir/usr/share/fonts/TTF/"
}
