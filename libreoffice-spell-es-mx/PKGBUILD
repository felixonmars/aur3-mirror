# Maintainer: delta48 <dark.magician.48[at]gmail[dot]com>
pkgname=libreoffice-spell-es-mx
pkgver=0.7
pkgrel=1
pkgdesc='Spanish dictionaries extension for LibreOffice for mexico'
arch=('any')
url='http://extensions.libreoffice.org/extension-center/spanish-dictionaries/pscreleasefolder.2012-04-18.1033472248/0.7'
license=('GPL3')
depends=('libreoffice-common' 'hunspell-es')
groups=('libreoffice-extensions')
conflicts=('languagetool')
makedepends=('unzip')
source=('http://extensions.libreoffice.org/extension-center/spanish-dictionaries/pscreleasefolder.2012-04-18.1033472248/0.7/mexico')
md5sums=('0de780714f84955112f38f35fb63a894')
package() {
  install -dm755 $pkgdir/usr/lib/libreoffice/share/extensions
  unzip -q $srcdir/mexico -d $pkgdir/usr/lib/libreoffice/share/extensions/mexico
}
