# Maintainer: Edgar Kalkowski <eMail@edgar-kalkowski.de>
pkgname=protege3-owl
pkgver=3.5
pkgrel=1
epoch=
pkgdesc="A free, open source ontology editor and knowledge-base framework – OWL extension"
arch=(any)
url="http://protege.stanford.edu/"
license=('MPL')
groups=()
depends=(java-runtime protege3)
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
source=(http://protege.stanford.edu/download/protege/3.5/sources/protege-owl-src-3.5.zip)
noextract=()
md5sums=('e5b947ab357f0628fdee592ed0ed9d4c')

build() {
	cd "$srcdir/Protege-OWL 3.5/"
        PROTEGE_HOME=/usr/share/java/protege3 ant plugin.dir
}

package() {
	cd "$srcdir/Protege-OWL 3.5/"
        install -d -m755 "$pkgdir"/usr/share/java/protege3/plugins/protege-owl
        install -m644 build/dist/protege-owl.jar "$pkgdir"/usr/share/java/protege3/plugins/protege-owl/
        install -m644 lib/* "$pkgdir"/usr/share/java/protege3/plugins/protege-owl/
}
