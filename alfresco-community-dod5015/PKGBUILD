# Maintainer: Bryce Nordgren <bnordgren@fs.fed.us>
pkgname=alfresco-community-dod5015
pkgver=3.4.d
pkgrel=1
epoch=
pkgdesc="""Records management module for Alfresco Content Management (DOD 5015).
Contains modules for both the repository and share applications."""
arch=(any)
url="http://wiki.alfresco.com/wiki/RecordsManagement"
license=('unknown')
groups=('alfresco')
depends=(alfresco-community-base=$pkgver)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=install
changelog=
source=(http://sourceforge.net/projects/alfresco/files/Alfresco%20$pkgver%20Community/$pkgname-$pkgver.zip)
md5sums=('0fbb90d99dbc7d80c16552191fabad7e')
noextract=()


package() {
	# make target directories (owned by the community-base pkg)
	alf_dir=$pkgdir/usr/share/webapps/alfresco
	mkdir -p $alf_dir/amps
	mkdir -p $alf_dir/amps_share

	# put the amps in place
	install --mode=644 $srcdir/$pkgname-$pkgver.amp \
			   $alf_dir/amps
	install --mode=644 $srcdir/$pkgname-share-$pkgver.amp \
			   $alf_dir/amps_share
}

# vim:set ts=2 sw=2 et:
