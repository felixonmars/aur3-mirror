#Contributor: Daniel Isenmann <daniel [at] archlinux [dot] org>
pkgname=openclipart-png-daily
#it doesn't matter what date, it automatically takes the newest package, see the source
pkgver=20090323
pkgrel=1
pkgdesc="An archive of user contributed clip art that can be freely used (png-version for OpenOffice.org)."
url="http://www.openclipart.org"
#Public Domain
license="PD"
arch=('i686' 'x86_64')
depends=('openoffice-base>=3.0.1')
#for converting svg to png, because Openoffice doesn't support SVG
makedepends=('inkscape')
source=(http://download.openclipart.org/downloads/daily_SVG_snapshot.tar.bz2)
md5sum=()

build() {
    cd $startdir/src/
		mkdir clipart-unsorted
    #convert all svg to png in width 600 pixel, aspect ratio save
    echo "Converting svg to png... (be patient)"
		#Move all svg in one directory
    find . -name "*.svg" -exec mv {} ./clipart-unsorted/ \; &>/dev/null
		cd clipart-unsorted
		#Convert
		for i in *.svg; do 
			inkscape -f "$i" -e "$i.png" -w 600 &>/dev/null;
		done
    #loseless compresson for smaller package size (it durations very long)
		#if you want compression then uncomment the next two lines and make sure you have installed "optipng"
    #echo "Compressing png files... (be very patient)"
    #find -name *png -exec optipng -q {} \;

    mkdir -p $startdir/pkg/opt/openoffice/basis-link/share/gallery/daily-unsorted
    mv $startdir/src/clipart-unsorted/*png $startdir/pkg/opt/openoffice/basis-link/share/gallery/daily-unsorted/
    #generating OpenOffice.org gallery files
    for dir in `ls -1 $startdir/pkg/opt/openoffice/basis-link/share/gallery/` ; do
       echo "Doing gallery $dir..."
       find $startdir/pkg/opt/openoffice/basis-link/share/gallery/$dir -name "*.png" -and -not -type l >> $startdir/src/$dir.filelist
       split -d -l 250 $startdir/src/$dir.filelist $startdir/src/$dir.filelist- 
       for file in $startdir/src/$dir.filelist-*; do
         echo "Processing filelist $file"
         /opt/openoffice/basis-link/program/gengal --name "$dir" --path "$startdir/pkg/opt/openoffice/basis-link/share/gallery/" --destdir "$startdir/pkg" --number-from "200" `cat $file` &>/dev/null;
         done
    done
}
