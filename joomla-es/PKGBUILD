 
pkgname=joomla-es
pkgver=1.6.0
pkgrel=1
pkgdesc="Sistema de Administracion de Contenidos"
arch=('i686' 'x86_64')
url="http://www.joomlaspanish.org/"
license=('GPL')
depends=('php>=5.2' 'mysql>=5.0.x' 'apache>=2.x')
provides=('joomla')
install=${pkgname}.install
source=(http://joomlacode.org/gf/download/frsrelease/13915/60349/Joomla_$pkgver-Spanish-Pack_Completo.zip)
md5sums=('08e2fc95101cf53e34071c72ad33fec2')

build() {
# Install Joomla files to the package directory.
install -dm755 "$pkgdir/srv/http/joomla" || return 1
cp -r "$srcdir"/* "$pkgdir/srv/http/joomla" || return 1

# Remove the symlink which points to the Joomla tarball itself.
rm -f "$pkgdir/srv/http/joomla/Joomla_$pkgver-Spanish-pack_completo.zip" || return 1

# Remove unnecessary execute permissions.
find "$pkgdir/srv/http/joomla" -type f -exec chmod a-x {} \; || return 1
} 
