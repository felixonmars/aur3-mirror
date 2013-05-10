# Contributor: Michael Manley <mmanley@nasutek.com>
# Contributor: Patrick CRESSANT <pcressant@yahoo.fr>

# Rinse RPM Distro Bootstrapper

pkgname=rinse
pkgver=2.0.1
pkgrel=1
pkgdesc="Bootstrap a rpm based distribution like debootstrap"
arch=('any')
url="http://xen-tools.org/software/rinse/index.html"
license=('GPL')
groups=()
depends=('glibc' 'perl' 'perl-html-parser' 'perl-uri' 'perl-libwww' 'rpm2cpio' 'wget' 'rpm' 'cpio')
makedepends=('make')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=('etc/rinse/rinse.conf')
options=()
install=
source=("http://www.steve.org.uk/Software/rinse/rinse-2.0.1.tar.gz")
noextract=()
md5sums=('1221942846f4caa6e621cfc85f759841')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX="$pkgdir/" install
}
