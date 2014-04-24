# Maintainer: Matthew Kramara <mattkramara@gmail.com>

pkgname=faforever-hg
pkgver=r688.373379fffd39
pkgrel=1
pkgdesc="Community maintained forged alliance system, runs Supreme Commander through wine (Linux not officially supported)"
arch=('any')
url="https://www.faforever.com"
license=('GPLv3')
depends=('python2' 'wine' 'python2-matplotlib' 'python2-numpy' 'python2-pyqt4' 'python2-sip')
makedepends=('mercurial')
provides=('faforever')
conflicts=('faforever')
source=('hg+https://bitbucket.org/fafafaf/modular-client-linux-fix')
md5sums=('SKIP')
_gitname=modular-client-linux-fix

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
	cd "$srcdir"/$_gitname/uid_loader
	tar -xzvf "$srcdir"/$_gitname/uid_loader/uid_loader_bin.tar.gz
	cp "$srcdir"/$_gitname/uid_loader/{uid.dll,uid.exe,LIBEAY32.dll} "$srcdir"/$_gitname/src
	if [ -e "$srcdir"/faforever ] 
	then
		rm -rf "$srcdir"/faforever
	fi
	printf "#!/bin/bash\npython2.7 /usr/share/faforever/main.py\n" >> "$srcdir"/faforever
}

package() {
	mkdir -p "$pkgdir"/usr/share/
	cp -dr --no-preserve=ownership "$srcdir"/$_gitname/src "$pkgdir"/usr/share/faforever 
	install "$srcdir"/faforever "$pkgdir"/usr/bin/faforever -Dm 755
}
