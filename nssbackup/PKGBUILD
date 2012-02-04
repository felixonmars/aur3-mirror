# Contributor: Andrew West <andrew@keyboardcowboy.co.uk>

pkgname=nssbackup
pkgver=0.2
_subpkgver=rc7
pkgrel=2
pkgdesc="Not So Simple Backup suite, is a backup solution for common desktop use."
arch=(i686 x86_64)
url="https://launchpad.net/nssbackup"
license=('GPL')
groups=()
depends=( 'python' 'gzip' )
makedepends=( 'sed' 'setuptools' )
optdepends=()
provides=( 'bzip2' )
conflicts=()
replaces=()
backup=( '/etc/nssbackup.conf' )
options=()
install=
source=(http://launchpad.net/$pkgname/$pkgver/$pkgver$_subpkgver/+download/${pkgname}_$pkgver-0~$_subpkgver.orig.tar.gz)
noextract=()
md5sums=('c7fac4bda21350022eda110c56739763')

build() {
  cd "$srcdir/$pkgname-$pkgver-0.orig"

  # Fix install location
  sed -i "s|/usr/local|${pkgdir}/usr|g" Makefile

  # Use pacman to get package lists
  sed -i "s|dpkg --get-selections|pacman -Q|" src/nssbackup/managers/BackupManager.py

  # Fix admin -> adm
  sed -i 's|getgrnam("admin")|getgrnam("adm")|' src/nssbackup/managers/BackupManager.py
  sed -i "s|'admin'|'adm')|" src/nssbackup/managers/BackupManager.py



  make || return 1
  make install || return 1
}

package() {
  # Rewrite the resource file to use the correct install directory
  echo "aoeua ${pkgdir}"
  sed -i "s|^${pkgdir}/usr|/usr|g" ${pkgdir}/usr/lib/python2.6/site-packages/nssbackup/ressources
}

# vim:set ts=2 sw=2 et:
