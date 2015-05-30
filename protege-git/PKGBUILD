# Maintainer: Mariano Street <mctpyt@gmail.com>.
# Based on the PKGBUILD for `protege-4.3.0.304-2`.

pkgname=protege-git
_name=protege
_tagname=protege-parent
_internalname=Protege
pkgver=r5.0.0.beta.17.24.g289d272
_internalver=5.0.0-beta-18-SNAPSHOT
pkgrel=3
pkgdesc='Free, open source ontology editor and knowledge-base framework'
arch=('any')
url='http://protege.stanford.edu/'
license=('MPL')
makedepends=('git' 'maven')
depends=('java-runtime' 'graphviz')
provides=('protege')
conflicts=('protege')
source=('git+https://github.com/protegeproject/protege.git')
sha1sums=('SKIP')
changelog=ChangeLog

pkgver() {
    cd "$_name"
    git describe --long | sed "s/^$_tagname-/r/; s/-/./g"
}

build() {
    cd "$srcdir/$_name"
    mvn clean package
}

package() {
    cd "$srcdir/$_name"

    install -D license.txt "$pkgdir/usr/share/licenses/protege/MPL.txt"

    cd $_name-distribution/target
    cd $_name-$_internalver-platform-independent/$_internalname-$_internalver

    # Remove Windows and Mac OS X crud.
    rm run.bat run.command

    sed -i "s|^cd.*|case \"\$1\" in\n\
/*) arg=\"\$1\";;\n\
*) arg=\"\$(pwd)/\$1\";;\n\
esac\n\
cd /usr/share/java/$_name|; \
            s|^java|exec java|; \
            s| \\\$1| \"\$arg\"|" run.sh
    install -D run.sh "$pkgdir/usr/bin/$_name"
    rm run.sh

    install -d "$pkgdir/usr/share/java/$_name"
    cp -r * "$pkgdir/usr/share/java/$_name"
}
