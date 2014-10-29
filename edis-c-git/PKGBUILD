# Maintainer: Victor <vicgua@outlook.com>
pkgname=edis-c-git
pkgver=r207.ff2660b
pkgrel=1
#epoch=
pkgdesc="Lightweight C IDE"
arch=('any')
url="https://github.com/centaurialpha/edis"
license=('GPL3')
groups=()
depends=('python2>=2.7.0' 'pyqt>=4.8.0')
makedepends=('git')
#checkdepends=()
optdepends=()
provides=(edis-c)
conflicts=(edis-c)
#replaces=()
#backup=()
#options=()
#install=
#changelog=
source=('edis-c::git+https://github.com/centaurialpha/edis.git'
         archlinux.patch
         edis-c.png
         edis-c.desktop)
#noextract=()
md5sums=('SKIP'
         'b33d0660f8cd7f81e9c08a41a44b10e5'
         '9fe0c4607e38d60a9d095bb2980697fa'
         'a220bd07538e499eb68f9796036fd5fb')
sha256sums=('SKIP'
            '6e62b54944c5cd0ccddb3b508a2eeadd5eef54462fc26ac7a276908b84e3af68'
            '097d77de66801b9a270970c4928e33f6eb7d19e872e870816c37d9df31a79b90'
            '68df24708cb0c55ec4499c7d635037bfed0ba675189039025369b034e65abc19')
pkgver() {
  cd "$srcdir/edis-c"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/edis-c"
	patch -p1 -i "$srcdir/archlinux.patch"
}

build() {
	echo > /dev/null
}

# check() {
# 	No check
# }

package() {
	cd "$srcdir"
	mkdir -p "$pkgdir/opt"
	mkdir -p "$pkgdir/usr/bin"
	cp -r "edis-c" "$pkgdir/opt"
	rm -rf "$pkgdir/opt/edis-c/.git/"
	chmod -R ugo+x "$pkgdir/opt/edis-c"
	ln -s "/opt/edis-c/edis-c.py" "$pkgdir/usr/bin/edis-c"
	install -Dm644 "edis-c.desktop" "$pkgdir/usr/share/applications/edis-c.desktop"
	install -Dm644 "edis-c.png" "$pkgdir/usr/share/pixmaps/edis-c.png"
}
