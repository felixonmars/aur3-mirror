# Contributor: Michal Lisowski <lisu at riseup dot net>
# Maintainer: Sebastian Novak <sebastiannovak at gmx dot net>

pkgname=urw
pkgver=3.19
pkgrel=3
pkgdesc="UnReal World is a unique low-fantasy roguelike game set in the far north during the late Iron-Age."
arch=('i686' 'x86_64')
url='http://www.unrealworld.fi/'
license=('custom: donationware')
makedepends=('rpmextract')
groups=('games')
case "$CARCH" in
	i686)	depends=('sdl_image' 'sdl_mixer')
        source=("http://www.unrealworld.fi/dl/linux/opensuse/urw-3.19-suse1220.i586.rpm" 'LICENSE')
		md5sums=('a000bd6633bb48b613e3823e64720860' '2650bd3ddd53edde625300397a14f209')
		_arch=i386;;

    x86_64)	depends=('lib32-sdl_image' 'lib32-sdl_mixer')
        source=("http://www.unrealworld.fi/dl/linux/opensuse/urw-3.19-suse1220.i586.rpm" 'LICENSE')
		md5sums=('a000bd6633bb48b613e3823e64720860' '2650bd3ddd53edde625300397a14f209')
		_arch=amd64;;
esac
_orgpkg="urw-3.19-suse1220.i586.rpm"
noextract=("${_orgpkg}")
install="urw.install"
build() {
	# Extract data files
    rpmextract.sh *.rpm
	# Move doc files to right location
    mv "$srcdir/usr/share/doc/packages/urw" "$srcdir/usr/share/doc/"
    rmdir "$srcdir/usr/share/doc/packages"
}

package() {
  cp -R "$srcdir"/usr "$pkgdir"/
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

