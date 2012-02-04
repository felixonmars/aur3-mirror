# Maintainer: Bryce Nordgren <bnordgren@fs.fed.us>
pkgname=alfresco-community-spp
pkgver=3.4.d
pkgrel=1
epoch=
pkgdesc="Sharepoint protocol package for Alfresco."
arch=(any)
url="http://wiki.alfresco.com/wiki/SharePoint_Protocol"
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
md5sums=('a9fb19c6af665ed48583bf6cd42fc2f4')
noextract=()


package() {
	# make target directories (owned by the community-base pkg)
	alf_dir=$pkgdir/usr/share/webapps/alfresco
	mkdir -p $alf_dir/amps

	# put the amps in place
	install --mode=644 $srcdir/$pkgname-$pkgver.amp \
			   $alf_dir/amps
}


# vim:set ts=2 sw=2 et:
