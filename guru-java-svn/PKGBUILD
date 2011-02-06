# Contributor: Christopher Schwaab -- christopher.schwaab gmail
pkgname=guru-java-svn
pkgver=145
pkgrel=1
pkgdesc="A pure functional programming language suitable for proofs."
url="http://code.google.com/p/guru-lang/"
license=('BSD')
arch=('x86_64' 'i686')
depends=('java-environment')
makedepends=('subversion')

source=()
md5sums=()

_svntrunk='http://guru-lang.googlecode.com/svn/branches/1.0a/'
_svnmod='guru-lang'

build() {
        cd ${srcdir}

        if [ -d $_svnmod/.svn ]; then
                (cd $_svnmod && svn up)
        else
                svn co $_svntrunk guru-lang
        fi

cat > $_svnmod/bin/guru <<__EOF
#!/bin/sh
if [ \$GURU_LANG ]; then
  java -cp \$GURU_LANG guru.Main \$*
elif [ -d ~/guru-lang/ ]; then
  java -cp ~/guru-lang/ guru.Main \$*
else
  java -cp /opt/guru-lang/ guru.Main \$*
fi
__EOF

cat > $_svnmod/bin/carraway <<__EOF
#!/bin/sh
if [ -d ~/guru-lang ]; then
  java -cp ~/guru-lang/ guru.carraway.Main \$*
else
  java -cp /opt/guru-lang/ guru.carraway.Main \$*
fi
__EOF

        mkdir -p $pkgdir/opt
        make -C $_svnmod go
        make -C $_svnmod carraway
        find $_svnmod | grep -v .svn | cpio -p -dum $pkgdir/opt || return 1
}
