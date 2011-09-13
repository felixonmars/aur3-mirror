# Maintainer: Dan Serban

pkgname=groovedown-via-wine
pkgver=0.67
pkgrel=1
pkgdesc="A simple GrooveShark downloader that saves music to your /tmp directory"
arch=(any)
url=http://groovedown.me/groovedown-on-linux/
license=(unknown:freeware)
depends=(libnotify wine wine_gecko)
makedepends=(unrar)
source=("http://ompldr.org/vYWMwcg/Groovedown.0.67.rar"
        groovedown_settings.ini
        groovedown.sh)
md5sums=('200dbe959d874ff3c7bc21eb92dd0678'
         '4dd56c53f66be0a744a18492ac4506ce'
         'ac502d54f9bd37565f5d2fd810ccdc34')

build()
{
  install -Dm755 groovedown.sh "${pkgdir}"/usr/bin/groovedown
  install -Dm644 groovedown_settings.ini "${pkgdir}"/usr/share/groovedown/groovedown_settings.ini
  unrar x Groovedown.${pkgver}.rar
  cd "Groovedown ${pkgver}"
  mv *.exe *.dll "${pkgdir}"/usr/share/groovedown/
}

