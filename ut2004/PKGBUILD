# Maintainer: NiteHogg <keith.b.elliott [at] gmail [dot] com>
# Contributor: Slash <demodevil5 [at] yahoo [dot] com>
# Contributor: Karsten Anderson <orbitcoder@gmail.com>

pkgname=ut2004
epoch=1
pkgver=3369_2
_pkgvermaj=3369
_pkgvermin=2
pkgrel=1
pkgdesc="Popular first person shooter, native Linux version"
epoch=1
arch=('i686' 'x86_64')
url="http://www.unrealtournament2004.com"
license=('custom')
depends=('sdl' 'openal' 'unshield' 'libstdc++5')
install=ut2004.install
changelog=ChangeLog
#source=("http://planet64bit.de/fileZ/ut2004-lnxpatch3369.tar.bz2"
source=("http://downloads.unrealadmin.org/UT2004/Patches/Linux/$pkgname-lnxpatch$_pkgvermaj-$_pkgvermin.tar.bz2"
    "ut2004.desktop"
    "install-cabs.sh"
    "ut2004.sh")
md5sums=('0fa447e05fe5a38e0e32adf171be405e'
         'b4ca5855b8fc6d283b49c8df469d61c2'
         '73010c33694c8091f3e80b1102a8a06e'
         '85623fe9fecd0678e4f12902c22d7272')

build() {

    # Making sure directories exist.
    install -d $pkgdir/usr/share/{applications,pixmaps,licenses}

    install -d $pkgdir/opt/ut2004
    install -d $pkgdir/opt/ut2004/{Animations,Help,Textures,Web,Benchmark,ForceFeedback,KarmaData,Maps,Music,StaticMeshes,Sounds,Speech,System}

    # Install UT2004 Linux patch data. Will later do a non-clobber
    # move over the top of it.
    cp -R $srcdir/UT2004-Patch/* $pkgdir/opt/ut2004

    # Install helper scripts.
    install -D -m 555 $srcdir/install-cabs.sh \
        $pkgdir/opt/ut2004/Scripts/install-cabs
    install -D -m 555 $srcdir/ut2004.sh \
        $pkgdir/opt/ut2004/Scripts/ut2004

    # Install license.
    install -D -m 644 $srcdir/UT2004-Patch/System/License.int \
        $pkgdir/usr/share/licenses/$pkgname/LICENSE

    # Install desktop file.
    install -D -m 644 $srcdir/ut2004.desktop \
            $pkgdir/usr/share/applications/ut2004.desktop

    if [ "$CARCH" == "x86_64" ]
    then
        sed 's/ut2004-bin/&-linux-amd64/g' $pkgdir/opt/ut2004/Scripts/ut2004 > $pkgdir/opt/ut2004/Scripts/ut2004.TMP
    
        mv -f $pkgdir/opt/ut2004/Scripts/ut2004.TMP \
            $pkgdir/opt/ut2004/Scripts/ut2004
        chmod 555 $pkgdir/opt/ut2004/Scripts/ut2004
    else
        rm $pkgdir/opt/ut2004/System/ucc-bin-linux-amd64
        rm $pkgdir/opt/ut2004/System/ut2004-bin-linux-amd64
    fi

    # Installing empty icon and cd key file placeholders.
    cat /dev/null > $pkgdir/usr/share/pixmaps/Unreal.ico
    cat /dev/null > $pkgdir/opt/ut2004/System/CDkey 
        
    # Create symbolic links to system libraries in game directory.
    ln -s /usr/lib/libSDL-1.2.so.0 $pkgdir/opt/ut2004/System || return 1
    ln -s /usr/lib/libopenal.so $pkgdir/opt/ut2004/System/openal.so || return 1
}
# vim:set ts=2 sw=2 et:
