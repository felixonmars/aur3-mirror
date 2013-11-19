# Maintainer: Edgar Kalkowski <eMail@edgar-kalkowski.de>
pkgname=protege3
pkgver=3.5
pkgrel=1
epoch=
pkgdesc="A free, open source ontology editor and knowledge-base framework"
arch=(any)
url="http://protege.stanford.edu/"
license=('MPL')
groups=()
depends=(java-runtime)
makedepends=(apache-ant)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://protege.stanford.edu/download/protege/3.5/sources/protege-src-3.5.zip)
noextract=()
md5sums=('4294d591e9ae6dcdb2b6b784ceabc415')

build() {
	cd "$srcdir/Protege 3.5"
        ant
}

package() {
	cd "$srcdir/Protege 3.5/"
        install -d -m755 "$pkgdir"/usr/share/java/protege3
        install -m644 build/dist/protege.jar "$pkgdir"/usr/share/java/protege3/
        install -m644 lib/* "$pkgdir"/usr/share/java/protege3/
        install -d -m755 "$pkgdir"/usr/bin/
        cat << EOF > "$pkgdir"/usr/bin/protege3
#!/bin/sh
cd /usr/share/java/protege3
java -jar protege.jar
EOF
       chmod +x "$pkgdir"/usr/bin/protege3
}
