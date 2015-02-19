# Mantainer: Martin Villagra (possum) <mvillagra0@gmail.com>
# Contributor: Martin Villagra (possum) <mvillagra0@gmail.com>

pkgname=pirate-get-git
pkgver=r54.2bc33ae
pkgrel=1
pkgdesc="Command line tool for searching torrents on The Pirate Bay."
arch=('i686' 'x86_64')
url="https://github.com/vikstrous/pirate-get"
depends=('python2-beautifulsoup4')
optdepends=('python2-colorama: for using --color parameter')
makedepends=('git')
license=('GPL')
source=('git://github.com/vikstrous/pirate-get.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname/-git/}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  	cd "$srcdir/${pkgname/-git/}"
	TMP=$(mktemp pirate-get-XXXXXX)
	if [ $(which python2.7) ]
	then
		echo "#!/usr/bin/env python2.7" > "$TMP"
	elif [ `which python2` ]
	then
		echo "#!/usr/bin/env python2" > "$TMP"
	else
		echo "#!/usr/bin/env python" > "$TMP"
	fi
	sed 1d pirate-get.py >> "$TMP"
  	install -Dm655 "$TMP" "$pkgdir/usr/bin/pirate-get"
}
