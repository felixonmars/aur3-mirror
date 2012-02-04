# Maintainer: andrewy <andrew@andrewyates.net>
pkgname=evetimer
pkgver=0.9.2
pkgrel=2
pkgdesc="Skill monitor for EVE Online"
arch=(i686 x86_64)
depends=('python>=2.4' 'pygtk>=2.10.0' 'gtk2>=2.8.0')
source=(http://files.beerta.de/EveTimer-0.9.2.tar.gz)
md5sums=('6daff07adc22b6998c839b26ecca0f48')
url="http://aello.beerta.net/EveTimer/"
license=('GPL2')
build()
{
  cd $startdir/src/EveTimer-$pkgver
  python setup.py install --prefix=/usr --root=$startdir/pkg
}
