# Maintainer: Michael Kogan <photon89 at gmail dot com>
# Contributor: Lauri Niskanen <ape@ape3000.com>
# Contributor: Travis Nickles <ryoohki7@yahoo.com>
# Contributor: Stefan Lohmaier <noneuss at gmail dot com>

pkgname=stepmania-svn
pkgver=28586
pkgrel=1
pkgdesc="SVN version of StepMania 4.0"
url="http://www.stepmania.com/wiki/StepMania_4.0"
license=('MIT')
arch=(i686 x86_64)
depends=('gtk2' 'libmad' 'libtheora' 'mesa' 'ffmpeg')
provides=('stepmania')
makedepends=('pkgconfig' 'subversion')
source=(loading.xpm $pkgname-gcc43.patch $pkgname-multiuser.patch \
$pkgname-window-icons.patch $pkgname.desktop $pkgname.sh $pkgname.xpm \
$pkgname-autogen.patch $pkgname-libpng14.patch $pkgname-build.patch)
md5sums=('9f6a3f3aa5a7f079c9e32bc8eab3dabc'
    'b298f7fcffa7f65ccd3b29131dbb5b9b'
    'c9599191b7e6d77ba3ea5d99409c53f5'
    '958f3644d54978f01745be570979bb88'
    '0fefe966a945be7eab0d7c193f1f4738'
    '277aa7e3bf7559fda823789c336f0b57'
    '259578c54057050620151e530eb1c5af'
    '770895e15e8c534da625a57dc775b22e'
    '3a98d49cd1d9fc954697a13505182f75'
    '7e3c164022138e4bc74bfa5d874c3292')

_svntrunk=https://svn.stepmania.com/svn/trunk/stepmania/
_svnmod=stepmania

build() {
    cd $srcdir

    msg "Connecting to StepMania SVN server...."
    svn co $_svntrunk $_svnmod --config-dir ./ -r $pkgver

    msg "SVN checkout done or server timeout"
    msg "Starting make..."

    #cp -f loading.xpm $_svnmod/src/arch/LoadingWindow
    #cp -f $pkgname.xpm $_svnmod/src/arch/LoadingWindow/stepmania.xpm
    #cp -f $pkgname.xpm $_svnmod/src/archutils/Unix/stepmania.xpm

    cd $_svnmod
    #patch -Np0 -i $srcdir/$pkgname-gcc43.patch
    #patch -Np0 -i $srcdir/$pkgname-multiuser.patch
    #patch -Np1 -i $srcdir/$pkgname-window-icons.patch
    patch -Np0 -i $srcdir/$pkgname-autogen.patch
    patch -Np0 -i $srcdir/$pkgname-libpng14.patch
    #patch -Np0 -i $srcdir/$pkgname-build.patch

    sed -i 's|$swscale_repo|$swscale_repo@$swscale_rev|' Utils/build.sh || return 1

    sh autogen.sh || return 1
    #./configure
    #make
    ./Utils/build.sh --verbose || return 1
    mkdir -p $pkgdir/opt/$pkgname
    #cp src/stepmania src/GtkModule.so $pkgdir/opt/$pkgname
    cp stepmania GtkModule.so $pkgdir/opt/$pkgname

    install -D -m755 $srcdir/$pkgname.sh $pkgdir/usr/bin/$pkgname
    install -D -m644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
    install -D -m644 $srcdir/$pkgname.xpm $pkgdir/usr/share/pixmaps/$pkgname.xpm
    install -D -m644 $srcdir/$_svnmod/Docs/Licenses.txt $pkgdir/usr/share/licenses/$pkgname/Licenses.txt

    cp -r {Announcers,BackgroundEffects,BackgroundTransitions,BGAnimations,CDTitles,Characters,\
Courses,Data,Docs,NoteSkins,Packages,RandomMovies,Songs,Themes} $pkgdir/opt/$pkgname

    find $pkgdir/opt/$pkgname -type d -name ".svn" -exec rm -rf '{}' +;
    rm -f $pkgdir/opt/$pkgname/Docs/{*.gif,LUA*,Lua*,README-GUIDELINES,\
SMLanProtocol.txt,Stats.xml,TODO.*}
}
