# Contributor: Baptiste Grenier <baptiste@bapt.name>

pkgname=fortune-mod-fr
pkgver=0.02
pkgrel=4
pkgdesc="Collection of French fortune cookie files"
arch=('any')
url="http://www.fortunes-fr.org"
license=('custom')
depends=('fortune-mod')
groups=('fortune-mods')
source=("http://www.fortunes-fr.org/fortunes-fr/fortunes-fr-$pkgver.tar.gz")
md5sums=('07c2a2d56853bb02d8b48f31a0c6bf6e')

build() {
  cd "${srcdir}/fortunes-fr-${pkgver}"

  # Check it the system is in UTF-8
  if [ $(grep -ic 'utf-*8' /etc/locale.conf) != 0 ]; then
      ./configure --prefix=$pkgdir/usr --with-fortunesdir=$pkgdir/usr/share/fortune/fr --with-charset=UTF8
  else
      ./configure --prefix=$pkgdir/usr --with-fortunesdir=$pkgdir/usr/share/fortune/fr
  fi

  make || return 1

  mkdir -p "${pkgdir}/usr/share/licenses/fortune-mod-fr/"
  cp COPYING "${pkgdir}/usr/share/licenses/fortune-mod-fr/COPYING"

  make install
}
