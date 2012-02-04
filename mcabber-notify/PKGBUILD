# Maintainer: Nicolas Cornu <nicolas.cornu@ensi-bourges.fr>
# Contributor: Nicolas Cornu <nicolas.cornu@ensi-bourges.fr>
pkgname=mcabber-notify
pkgver=0.9
pkgrel=1
pkgdesc="Un module pour notifier lors de la réception de message"
arch=(any)
url="http://projetsti.ensi-bourges.fr/projects/perso-mcabber-notify"
license=('GPL3')
groups=
provides=
depends=('libnotify>=0.7.1')
optdepends=
makedepends=('cmake>=2.6')
conflicts=
replaces=
backup=
install=
source=(http://projetsti.ensi-bourges.fr/attachments/download/87/$pkgname-$pkgver.tar.gz)
md5sums=(cb29162d54f247edebd72513181b4296)

build() {
  mkdir BUILD && cd BUILD || return 1
  cmake ../ || return 1
  make || return 1
}

package() {
  cd BUILD
  make DESTDIR="${pkgdir}" install || return 1
}
