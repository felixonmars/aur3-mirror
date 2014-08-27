# Maintainer: Andrew Webley <unsuspectinghero@gmail.com>
# Contributor: Dmitriy Morozov <archlinux@foxcub.org>

pkgname="chromium-libpdf-dev"
#The pkgver is the same as for google chrome dev. The library isn't meant to be distributed on its own so no other version information exists.
pkgver="38.0.2125.24"
pkgrel="1"
pkgdesc="A PDF Viewer for Chromium and Chromium based browsers"
url="http://wiki.archlinux.org/index.php/Chromium#libpdf.so"
arch=("i686" "x86_64")
license=("custom:chrome")
depends=("gcc-libs")
optdepends=("chromium: default browser to use plugin in (one of the optional dependencies needs to be installed to use the library)"
            "iron-bin: alternate google-chrome based browser, requires modifying the PKGBUILD")
sha512sums+=("395118e45e8c43cf491c48d932c9c49d056153d52d961d2812169b39256c398b6f16f37e2124ebf1daff31a625006f92225c537547b2e11605ce132ea4e2fa81")
source=("LICENSE")

if [ "$CARCH" = "i686" ]; then
  source+=("https://dl.google.com/linux/direct/google-chrome-unstable_current_i386.rpm")
  sha512sums+=("afd2de48de10972fd5fb5e5d626d2301ce3f69f5f2e0abbcc46e84c158f61dd061a284c7ada73f25b856f34f5d1263a179d080e0435e6d42f980ff6e468ccb6c")
elif [ "$CARCH" = "x86_64" ]; then
  source+=("https://dl.google.com/linux/direct/google-chrome-unstable_current_x86_64.rpm")
  sha512sums+=("5dcf98ed9a2a4abac34ddc93fcff68810417cdec4c6d36c9895a5464b25c27b16a31a3949c62c516b95342f335069db7cd9699b4f5390378cc980142d11b84c8")
fi

package(){
	#Uncomment the relevant line below to install the library in the correct place if you're running something other than chromium.

	#chromium
	install -Dm755 "$srcdir/opt/google/chrome-unstable/libpdf.so" "$pkgdir/usr/lib/chromium/libpdf.so"
	
	#iron-browser
	#install -Dm755 "$srcdir/opt/google/chrome/libpdf.so" "$pkgdir/opt/iron/libpdf.so"
	
	install -Dm755 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
