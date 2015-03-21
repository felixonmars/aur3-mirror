# Maintainer: Erik Johansson Andersson <exetoc@gmail.com>
pkgname=nim-git
pkgver=v0.10.2.816
pkgrel=1
pkgdesc="Imperative, multi-paradigm, compiled programming language (git)"
arch=('i686' 'x86_64')
url="http://nim-lang.org"
depends=()
license=('MIT')
makedepends=('git')
conflicts=('nim')
provides=('nim')
backup=("etc/nimdoc.cfg"
        "etc/nimdoc.tex.cfg"
        "etc/nim.cfg")
source=("${pkgname%-*}::git+https://github.com/Araq/nim.git#branch=devel"
        "git+https://github.com/nim-lang/csources.git#branch=devel")
options=(!emptydirs)
md5sums=('SKIP' 'SKIP')

pkgver () {
	cd "$srcdir/${pkgname%-*}"
	git describe | sed 's|\(.*-.*\)-.*|\1|;s|-|.|'
}

build() {
	cd "${srcdir}/${pkgname%-*}/"
	cp -r "$srcdir/csources/"* "build/"
	chmod +x "build/build.sh"

	cd build
	./build.sh

	cd ..
	./bin/nim c koch.nim
    ./koch boot -d:release -d:useGnuReadline --nimcache:$(mktemp -d)

	export PATH="$PATH:../bin/nim"

	cd lib
    ../bin/nim c --app:lib -d:createNimRtl -d:release --nimcache:$(mktemp -d) nimrtl.nim

	cd ../tools
    ../bin/nim c -d:release --nimcache:$(mktemp -d) nimgrep.nim
}

package() {
	cd "${srcdir}/${pkgname%-*}"
	mkdir -p "$pkgdir/usr/share/nim/doc" "$pkgdir/usr/lib/nim" "$pkgdir/etc"\
        "$pkgdir/usr/bin" "$pkgdir/usr/share/licenses/nim-git"

    cp copying.txt "$pkgdir/usr/share/licenses/nim-git/LICENSE"
	cp config/* "$pkgdir/etc/"
	cp -a lib/* "$pkgdir/usr/lib/nim/"
	cp -a compiler "$pkgdir/usr/lib/nim/"
	cp -r doc/* "$pkgdir/usr/share/nim/doc/"
	install -m755 bin/nim "$pkgdir/usr/bin/"
	install -m755 tools/nimgrep "$pkgdir/usr/bin/"
	install -m644 "lib/libnimrtl.so" "$pkgdir/usr/lib/libnimrtl.so"
    rm "$pkgdir/usr/lib/libnimrtl.so"
}
