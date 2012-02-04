#Contributor: Daniel Isenmann <daniel [at] archlinux [dot] org>
pkgname=openclipart-png
pkgver=0.18
pkgrel=4
pkgdesc="An archive of user contributed clip art that can be freely used (png-version for OpenOffice.org)."
url="http://www.openclipart.org"
#Public Domain
license="PD"
arch=('i686' 'x86_64')
depends=('openoffice-base>=3.0.1')
#for converting svg to png, because Openoffice doesn't support SVG
makedepends=('inkscape' 'optipng')
source=(http://openclipart.org/downloads/$pkgver/openclipart-$pkgver-svgonly.tar.bz2)
md5sums=('84e6ee889c8eb1208904e8e6f7004e63')

build() {
    cd $startdir/src/openclipart-$pkgver-svgonly
    #remove some (useless) images which inkscape cannot convert
    rm -rf clipart/special
    #convert all svg to png in width 600 pixel, aspect ratio save
    echo "Converting svg to png... (be patient)"
    find -name *svg -exec inkscape -f {} -e {}.png -w 600 \; &>/dev/null
    #delete all svg images
    find -name *svg -exec rm -f {} \;
    #loseless compresson for smaller package size (it durations very long)
    echo "Compressing png files... (be very patient)"
    find -name *png -exec optipng -q {} \;

    mkdir -p $startdir/pkg/opt/openoffice/basis-link/share/gallery/
    rm -f $startdir/src/openclipart-$pkgver-svgonly/clipart/{PASSFAIL,README,TODO}
    mv $startdir/src/openclipart-$pkgver-svgonly/clipart/* $startdir/pkg/opt/openoffice/basis-link/share/gallery/
    #generating OpenOffice.org gallery files
    for dir in `ls -1 $startdir/pkg/opt/openoffice/basis-link/share/gallery/` ; do
       echo "Doing gallery $dir..."
       find $startdir/pkg/opt/openoffice/basis-link/share/gallery/$dir -name "*.png" -and -not -type l >> $startdir/src/$dir.filelist
       split -d -l 250 $startdir/src/$dir.filelist $startdir/src/$dir.filelist- 
       for file in $startdir/src/$dir.filelist-*; do
         echo "Processing filelist $file"
         /opt/openoffice/basis-link/program/gengal --name "$dir" --path "$startdir/pkg/opt/openoffice/basis-link/share/gallery/" --destdir "$startdir/pkg" --number-from "70" `cat $file`;
         done
    done
}
