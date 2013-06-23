# Mantainer: Diego Principe <cdprincipe@at@gmail@dot@com>

pkgname=telescope
pkgver=1.0.0
pkgrel=1
pkgdesc="Telescope is an alternative task switcher, Exposé/Scale like" 
url="https://bitbucket.org/IlyaSkriblovsky/telescope"
arch=('i686' 'x86_64' 'arm')
license=('GPL')
depends=('libxcomposite' 'libxdamage' 'libxrender' 'imlib2' 'libxft' 'dbus' 'glib')
backup=('etc/telescope.conf' 'etc/telescope.keys')
source=("https://github.com/AdamCDunlap/telescope/archive/${pkgver}.tar.gz")
md5sums=('9bb5908779780e38fec7ceecd1c13f23')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make 
}
package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p $pkgdir/usr/bin
  mkdir $pkgdir/etc
  make PREFIX=$startdir/pkg/usr DESTDIR=${pkgdir} install 
}
