# Maintainer: Kevin Cox <kevincox.ca@gmail.com>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: K900 <k0009000@gmail.com>
pkgname=steam-rootallowed
pkgver=1.0.0.27
pkgrel=1
pkgdesc="Digital distribution client - bootstrap package - root allowed."
arch=("i686" "x86_64")
url="http://steampowered.com/"
license=('custom')
depends=(
	'bash' 'desktop-file-utils' 'hicolor-icon-theme' 'curl'
	'dbus' 'freetype2'  'gdk-pixbuf2' 'ttf-font' 'zenity'
)
if [[ "$CARCH" == "x86_64" ]]; then
	depends+=(lib32-libgl lib32-gcc-libs lib32-libx11)
	optdepends=(
		'lib32-ati-dri: for open source ATI driver users'
		'lib32-catalyst-utils: for AMD Catalyst users'
		'lib32-intel-dri: for open source Intel driver users'
		'lib32-nouveau-dri: for Nouveau users'
		'lib32-nvidia-utils: for NVIDIA proprietary blob users'
		'lib32-flashplugin: for flash video'
	)
build() {
	patch -Np1 -i "$srcdir/lib32-flashplugin-path.patch"
	patch "$srcdir/steam-$pkgver/steam" 'steam-allowroot.patch'
}
else
	optdepends=('flashplugin: for flash videos')
fi

install=steam.install

source=("http://repo.steampowered.com/steam/pool/steam/s/steam/steam_$pkgver.tar.gz"
        'lib32-flashplugin-path.patch'
        'steam-allowroot.patch')
sha1sums=('5a2dde921b2a211f8eac688ef86543575e72e5f1'
          'b4b3bd1d4ed26a1f4004b566b8cab2cdc7cf1c37'
          'dfed27155aa535f64fb437508c51855d7fca9e29')


package() {
	# Install license
	make -C steam-$pkgver DESTDIR=$pkgdir install

	install -Dm644 "$pkgdir/usr/share/doc/steam/steam_install_agreement.txt" "$pkgdir/usr/share/licenses/steam/LICENSE"

	# blank steamdeps because apt-get
	ln -sf /bin/true "$pkgdir/usr/bin/steamdeps"

}
#vim: set ft=PKGBUILD sw=2 ts=2 et
