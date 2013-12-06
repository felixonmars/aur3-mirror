# Maintainer:  Thomas Mudrunka <harvie@@email..cz>
# Contributor: Thomas Mudrunka <harvie@@email..cz>

pkgname=lftpfs
pkgver=0.4.3
pkgrel=1
pkgdesc="Read-only network filesystem with caching for smart mirroring of sites. (like Linux repositories) It's based on FUSE and LFTP client (supports FTP, HTTP, FISH, SFTP, HTTPS, FTPS protocols & works over proxies.) LftpFS is fork from unmaintained FuseFTP."
arch=('any')
license=('GPL')
url="http://lftpfs.sourceforge.net/"
makedepends=('perl')
depends=('lftp' 'perl' 'fuse' 'perl-fuse' 'perl-ipc-run')
source=(
	#just for sure!
	"http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz"
)
sha256sums=('5116e06dfc03c4000f3157916d4bf2b9bcd6f47667790217dbf3b9f04861bf39')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}/ || return 1

	perl Makefile.PL || return 1
	make || return 1
	make DESTDIR=${pkgdir} install || return 1
}
