arch=(i686 x86_64)
pkgname=desire-data
pkgver=20080124
pkgrel=1
pkgdesc="DesireData is a project whose main goal is to enhance the everyday experience of the PureData users and developers."
url="https://devel.goto10.org/"
license=
depends=('gcc-libs' 'tk' 'tcl')
makedepends=('cvs')
install=$pkgname.install
source=('')
md5sums=()

build() {
cd $startdir/src

cvs     -d:pserver:anonymous@pure-data.cvs.sourceforge.net:/cvsroot/pure-data login
cvs -z6 -d:pserver:anonymous@pure-data.cvs.sourceforge.net:/cvsroot/pure-data co -r desiredata pd
cvs -z6 -d:pserver:anonymous@pure-data.cvs.sourceforge.net:/cvsroot/pure-data co pd/doc

cd pd/src

msg "CVS checkout done or server timeout"
msg "Starting make..."

./configure --prefix=/usr --enable-oss --enable-alsa --enable-jack --enable-portaudio --enable-portmidi --enable-debug --enable-static --enable-fftw
    cat makefile | sed 's/-static//g' > Makefile; rm makefile; mv Makefile makefile
    cat makefile | sed 's/-lpd//g' > Makefile; rm makefile; mv Makefile makefile

    make || return 1

    install -d 644 $startdir/pkg/opt/desire-data/
    install -d 644 $startdir/pkg/usr/bin/

    mv $startdir/src/* $startdir/pkg/opt/desire-data
    echo "cd /opt/desire-data/pd/src/; wish desire.tk" > $startdir/pkg/usr/bin/desire
    chmod 755 $startdir/pkg/usr/bin/desire
}
