# Maintainer: Meow < meow at linux dot cn >
pkgname=putty-desktop
_pkgname=putty
pkgver=0.62
pkgrel=2
pkgdesc="A terminal integrated SSH/Telnet client"
arch=('i686' 'x86_64')
url="http://www.chiark.greenend.org.uk/~sgtatham/putty/"
license=('MIT')
depends=('gtk2')
provides=('putty=0.62')
conflicts=('putty')
makedepends=('imagemagick')
source=(
		http://the.earth.li/~sgtatham/putty/${pkgver}/${_pkgname}-${pkgver}.tar.gz
		glib-deprecated-functions.patch
		careful-key-length.patch
		)
sha1sums=(
		'5898438614117ee7e3704fc3f30a3c4bf2041380'
		'6debf39e38e4822f6688ad3c1b6a030a19cef2ff'
		'a4f52e2a86707275caadbce932924eae71848b12'
		)
install=$pkgname.install

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  patch -Np1 -i ../glib-deprecated-functions.patch
  patch -Np1 -i ../careful-key-length.patch

  cd "${srcdir}/${_pkgname}-${pkgver}/unix"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}/unix"
  make DESTDIR="${pkgdir}" install
  install -D -m644 ../LICENCE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cd "$pkgdir"
  install -dm755 usr/share/icons/hicolor/{16x16,32x32,48x48}
  cd "${srcdir}/${_pkgname}-${pkgver}/windows"
  convert putty.ico putty.png
  index=0
  for size in 16 32 48;do
	  install -Dm644 putty-$index.png "$pkgdir"/usr/share/icons/hicolor/${size}x${size}/apps/putty.png
	  index=$((index+1))
  done

  install -dm755 "$pkgdir"/usr/share/applications
  cat <<-_EOF_ > "$pkgdir"/usr/share/applications/putty.desktop
	[Desktop Entry]
	Name=Putty
	TryExec=putty
	Exec=putty %F
	Icon=putty
	Terminal=false
	Type=Application
	Categories=Application;Network
	GenericName=SSH/Telnet Client
	Comment=A terminal intergrated SSH/Telnet client
	_EOF_
}
