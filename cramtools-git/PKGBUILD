# Maintainer: Cory Giles <cory.b.giles@gmail.com>

pkgname=cramtools-git
pkgver=20130501
pkgrel=2
pkgdesc="Compression by reference for BAM genomic sequence alignment files."
arch=('any')
url="http://www.ebi.ac.uk/ena/about/cram_toolkit"
license=('APACHE')
depends=('java-runtime')
makedepends=('java-environment' 'apache-ant' 'git')
source=()
md5sums=() 

_gitname=cramtools
_gitroot=git://github.com/enasequence/cramtools.git
JARDIR=/usr/share/java/$_gitname

build() {
	cd "$srcdir"
    msg "Connecting to GIT server...."

    if [[ -d "$_gitname" ]]; then
        cd "$_gitname" && git pull origin
        msg "The local files are updated."
    else
        git clone "$_gitroot" "$_gitname"
        cd "$_gitname"
    fi

    newpkgver=$(date +%Y%m%d)
    msg "GIT checkout done or server timeout"
    msg "Starting build..."

    ant -buildfile build/build.xml runnable
    mv cramtools*.jar cramtools.jar
    cat << EOF > cramtools
#!/bin/sh
"\$JAVA_HOME/bin/java" -jar '$JARDIR/cramtools.jar' "\$@"
EOF
    chmod +x cramtools
}

package() {
	cd "$srcdir/$_gitname"
    mkdir -p $pkgdir/$JARDIR $pkgdir/usr/bin
    install -t $pkgdir/$JARDIR cramtools.jar
    install -t $pkgdir/usr/bin cramtools
}
