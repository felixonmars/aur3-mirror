# Maintainer: Pablo Lezaeta <prflr88 (arro'a) gmail puntocom>
# Contributor: simoessgabriel <simoes.sgabriel@gmail.com>

pkgname=iron-bin
pkgver=42.0.2250.1
pkgrel=1
pkgdesc="A web browser based on Chromium without Google's «tracking features»"
arch=("i686" "x86_64")
url="http://www.srware.net/en/software_srware_iron.php"
license=("BSD")
depends=("gtk2" "dbus-glib" "nss" "alsa-lib" "xdg-utils" "bzip2"
"libevent" "libxss" "libgcrypt" "ttf-font" "desktop-file-utils"
"hicolor-icon-theme" "gconf" "snappy" "speech-dispatcher")
makedepends=("imagemagick")
optdepends=("kdebase-kdialog: needed for file dialogs in KDE"
	    "chromium-pepper-flash: flash plugin")
install=${pkgname}.install
options=("!emptydirs" "!strip")
source=("nacl_${pkgver}-${pkgrel}.zip::http://srware.net/downloads/nacl.zip"
	"iron.desktop"
        "iron.png::http://upload.wikimedia.org/wikipedia/commons/1/1e/Iron_logo.png"
        "iron.sh"
        "iron.default"
        "LICENSE")
source_i686+=("http://www.srware.net/downloads/iron-linux.tar.gz")
source_x86_64+=("http://www.srware.net/downloads/iron-linux-64.tar.gz")

package() {
  	install -Dm755 iron.sh "$pkgdir/usr/bin/iron"
  	install -d "$pkgdir/usr/share/iron"

	if [ "$CARCH" == "x86_64" ]; then
		local _src="$srcdir/iron-linux-64"
			_64="-64"
	else
		local _src="$srcdir/iron-linux"
			_64=""
	fi

	msg2 "Extracting the nacl"
  	#unzip "nacl_${pkgver}-${pkgrel}.zip" -x "nacl64.exe" "ppGoogleNaClPluginChrome.dll"

  	msg2 "Extracting iron-linux${_64}.tar.gz"
  	tar -xzvf "iron-linux${_64}.tar.gz"

	msg2 "Installing Native Client"
	if [ "$CARCH" == "x86_64" ]; then
    		mv "${srcdir}/nacl_irt_x86_64.nexe" "${pkgdir}/usr/share/iron/"
  	else
    		mv "${srcdir}/nacl_irt_x86_32.nexe" "${pkgdir}/usr/share/iron/"
  	fi

	cd "${_src}"
	cp -ra * "$pkgdir/usr/share/iron"

  	#udev workaround
  	ln -s /usr/lib/libudev.so.1 "$pkgdir/usr/share/iron/libudev.so.0"

	cd "$srcdir"
	for size in 16 22 24 32 48 64 128 256; do
		convert -resize ${size}x${size} iron.png iron_${size}.png
  		install -Dm64 iron_${size}.png "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/iron.png"
  	done

  	install -Dm644 iron.default "$pkgdir/etc/iron/default"
  	install -Dm644 iron.desktop "$pkgdir/usr/share/applications/iron.desktop"
  	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	msg2 "Changing permissions"
	find "${pkgdir}/" -type d -exec chmod 755 {} +
}

md5sums=('9b3e197fba9c26498f2d1e19c6ee4907'
         'de67dff0a58b5dc953db4f0d52fab0d7'
         '6e87f0b0f30d4cb9f6fc898951df64d0'
         'bd4d77e9737ef07cf0d763ce27b93200'
         '36f606a7e5ae3db2e28daa7c45c18c78'
         'bf55245411f7254565164c7482e0f98f')
md5sums_i686=('c9787d093ae69288152d411e5a556961')
md5sums_x86_64=('983c78cdf6719017b87df03279abf9ce')
