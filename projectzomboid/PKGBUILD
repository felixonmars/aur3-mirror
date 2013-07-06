# Maintainer: naelstrof <naelstrof@gmail.com>
pkgname=projectzomboid
pkgver=2.9.9.10
pkgrel=1
pkgdesc="Project Zomboid is a Zombie Survival RPG. You need a key from projectzomboid.com and game data from http://www.desura.com/games/project-zomboid/download in order to play."
arch=(any)
url="http://projectzomboid.com/"
license=('GPL')
depends=('java-runtime')
makedepends=('unzip')
#source=(projectzomboid-RC2.9-linux.patch)
#md5sums=('6694fc0137824f2761b7c897569bf1c8')
source=()
md5sums=()

_arch=`uname -m`
if [[ "$_arch" == "x86_64" ]]; then
    _filename="projectzomboid-amd64.${pkgver}.tar.gz"
    _filesum="23f43a27d1b3817457f33a24d3c3d718"
else
    _filename="projectzomboid-i386.${pkgver}.tar.gz"
    _filesum="6dfd258b267d15c0c9aef2f69d89bb29"
fi

# Here we create necessary desktop launch files and pixmaps, while removing windows related files.
# Oh we also make sure we have the game data.
prepare() {
    cd "$startdir"

    msg "Looking for game data..."
    if [[ ! -e "$_filename" ]]; then
        error "Missing $startdir/$_filename! Download $_filename and place it into $startdir You can get $_filename from here: http://www.desura.com/games/project-zomboid/download"
        exit 1
    fi

    # Check the file's integrity
    msg "Checking game data integrity..."
    _sum="$(md5sum $_filename | awk '{print $1}')"
    if [[ "$_sum" != "$_filesum" ]]; then
        error "Ingegrity check failed! Game data is corrupt, compromised, or newer than this PKGBUILD! Try redownloading the game or editing _filesum to match the correct MD5 sum of the game using \"md5sum $_filename\"."
        exit 1
    fi

    # Now extract the file so the rest of the application can use it.
    msg "Extracting game data..."
    tar -xf $_filename -C $srcdir

    msg "Creating desktop entry..."
    _f="$srcdir/${pkgname}.desktop"
    echo "[Desktop Entry]"                      >  $_f
    echo "Version=$pkgver"                      >> $_f
    echo "Name=Project Zomboid"                 >> $_f
    echo "GenericName=Project Zomboid"          >> $_f
    echo "Comment=Zombie Survival RPG"          >> $_f
    echo "Exec=/usr/bin/${pkgname}"             >> $_f
    echo "Terminal=false"                       >> $_f
    echo "Icon=${pkgname}.png"                  >> $_f
    echo "Type=Application"                     >> $_f
    echo "Categories=Game;"                     >> $_f

    msg "Creating executable..."
    _f="$srcdir/${pkgname}.sh"
    echo "#!/bin/sh"                                   >  $_f
    echo "/usr/share/java/${pkgname}/${pkgname}.sh"    >> $_f
    chmod +x $_f

    msg "Creating pixmap..."
    cp $srcdir/${pkgname}/${pkgname}.png $srcdir
}

#build() {
    #cd "$srcdir/$pkgname"
#
    #msg "Patching for Linux..."
    #patch -p1 -i $srcdir/projectzomboid-RC2.9-linux.patch
#
    #msg "Fixing case-sensitivity errors..."
    #cd media/sound
    #mv batswing.ogg batSwing.ogg
    #mv Bathit.ogg bathit.ogg
    #mv ambientOutsideDaybirds.ogg ambientOutsideDayBirds.ogg
#}

# Since it runs on java we don't need to compile anything.
# Here we move the package files into position.
package() {
    mkdir -p                            "$pkgdir/usr/bin"
    cp "$srcdir/${pkgname}.sh"          "$pkgdir/usr/bin/${pkgname}"
    mkdir -p                            "$pkgdir/usr/share/pixmaps"
    cp "$srcdir/${pkgname}.png"         "$pkgdir/usr/share/pixmaps"
    mkdir -p                            "$pkgdir/usr/share/java/${pkgname}"
    cp -R $srcdir/${pkgname}/*          "$pkgdir/usr/share/java/${pkgname}"
    mkdir -p                            "$pkgdir/usr/share/applications"
    cp "$srcdir/${pkgname}.desktop"     "$pkgdir/usr/share/applications"
}
