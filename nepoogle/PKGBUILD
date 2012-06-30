# Maintainer: Joffrey TISSERON <tisseron.joffrey@aliceadsl.fr>

pkgname=nepoogle
pkgver=0.9.3
pkgrel=1
pkgdesc="A search utility for Nepomuk inspired in Google's search syntax."
arch=('any')
url='http://kde-apps.org/content/show.php/Nepoogle?content=145505'
license=('GPL')
depends=('kdebindings-python2')
source=("http://kde-apps.org/CONTENT/content-files/145505-${pkgname}_v$pkgver.tar.gz"
        'nepoogle.desktop')
md5sums=('67007a368779b12ea1503d9e001cf74c'
         '02fd6dd9b1ce4c260e48004fb061932d')

package() {
  install -Dm644 ${srcdir}/nepoogle.desktop \
    $pkgdir/usr/share/applications/kde4/nepoogle.desktop

  install -Dm755 ${srcdir}/nepoogle $pkgdir/usr/bin/nepoogle
}
