# Contributor: Adam Nielsen <malvineous@shikadi.net>
# Contributor: Vitaliy Berdinskikh ur6lad[at]archlinux.org.ua
# Contributor: Andrea Agosti <cifvts@gmail.com>
# Contributor: Charles Clement <caratorn@gmail.com>
# Contributor: Geraldo Augusto Vecchiato <geraldoav@gmail.com>
# Maintainer: Adam Nielsen <malvineous@shikadi.net>

_pkgname=instantclient-basic
pkgname=lib32-oracle-${_pkgname}
pkgver=12.1.0.1.0
pkgrel=1
pkgdesc="Light replacement for the Oracle client (files to run OCI, OCCI and JDBC-OCI programs)"
arch=('x86_64')
url="http://www.oracle.com/technetwork/database/features/instant-client/"
license=('custom:OTN')
depends=('gcc-libs-multilib' 'lib32-libaio' "oracle-${_pkgname}")
options=(!strip)

# These are the only files we want to include in the source package
source=(LICENSE oracle.sh)
md5sums=('2d62e22e4f2d7e6d220fafde0f692a7d'
         '784005aa31cb56bb2303179d98fccd8e')
sha256sums=('f904a30b07ddf7806a33620f93b94c3d315154d26a371ece48695bb3555064a2'
            '36b5ab97950f1667403dd9b59c3cad25d8f9e457702feaece835d1bff7c971c9')

# Skip the next bit if we're building a source package for AUR, as we don't
# want these files included.
if [ $SOURCEONLY -ne 1 ]; then

	# Add the main file, depending on which architecture we're building for
    source[2]="${_pkgname}-linux-$pkgver.zip"
    md5sums[2]='7c3b522424713cc8d3814356cf092c02'
    sha256sums[2]='c9d6d73f41b32a32a38a7145cc5a788f868c8d90973550ce7490cf5e9d0dd421'

	# Warn the user if they haven't downloaded the file already
	if [ ! -f "${source[2]}" ]; then
		error "You need to download ${source[2]}"
		echo
		msg2 "This software cannot be downloaded automatically.  You will need to sign up"
		msg2 "for an Oracle account and download the software from Oracle directly.  Place"
		msg2 "the downloaded file in the same directory as the PKGBUILD and re-run makepkg."
		msg2 ""
		msg2 "The source .zip files can be downloaded from:"
		msg2 ""
		msg2 "http://www.oracle.com/technetwork/topics/linuxsoft-082809.html"
		msg2 ""
		msg2 ""
		msg2 "[1]: http://www.oracle.com/technetwork/licenses/instant-client-lic-152016.html"
		exit 1
	fi

fi

package() {
	cd "$srcdir/instantclient_12_1/"
	install -d "$pkgdir/usr/lib32"
	install -m 755 -t "$pkgdir/usr/lib32" *.so*
	install -m 644 -t "$pkgdir/usr/lib32" *.jar

	# create required symlinks
	cd "$pkgdir/usr/lib32" || return 1
	local lib link
	for lib in *.so*; do
		link=$lib
		while [[ ${link#*.} != so ]]; do
			link=${link%.*}
			ln -s $lib $link
		done
	done
}
