pkgname=juploadr
pkgver=1.1.2
pkgrel=1
pkgdesc="A photo manager/uploader for Flickr accounts, made in Java"
url="http://juploadr.org"
arch=("i686" "x86_64")
license=("GPL")
depends=("gtk2" "java-environment" "libxtst")

if [ "$CARCH" = "i686" ];then
    source=("http://downloads.sourceforge.net/project/juploadr/juploadr/1.1.2/jUploadr-1.1.2-linuxGTK-i386.tar.gz")
    md5sums=("6be4f8ab6937441e58648f14503d6607")
    build(){
        mkdir -p $startdir/pkg/usr/share/juploadr
        cd $startdir/src/jUploadr-1.1.2-linuxGTK-i386
        cp -r * $startdir/pkg/usr/share/juploadr

        echo "[Desktop Entry]" > ${startdir}/src/juploadr.desktop
        echo "Categories=Application;Graphics;" >> ${startdir}/src/juploadr.desktop
        echo "Comment=Java-GTK Client for uploading/managing photos in a Flickr account" >> ${startdir}/src/juploadr.desktop
        echo "Encoding=UTF-8" >> ${startdir}/src/juploadr.desktop
        echo "Exec=/usr/bin/juploadr" >> ${startdir}/src/juploadr.desktop
        echo "GenericName=juploadr" >> ${startdir}/src/juploadr.desktop
        echo "Hidden=false" >> ${startdir}/src/juploadr.desktop
        echo "Icon=juploadr.png" >> ${startdir}/src/juploadr.desktop
        echo "MimeType=application/vnd.adobe.air-application-installer-package+zip" >> ${startdir}/src/juploadr.desktop
        echo "Name=jUploadr" >> ${startdir}/src/juploadr.desktop
        echo "Terminal=false" >> ${startdir}/src/juploadr.desktop
        echo "Type=Application" >> ${startdir}/src/juploadr.desktop

        echo "#!/bin/sh" > $startdir/src/juploadr
        echo "/usr/share/juploadr/jUploadr" >> $startdir/src/juploadr

        install -m644 -D $startdir/src/jUploadr-1.1.2-linuxGTK-i386/juploadr_icon.png $startdir/pkg/usr/share/pixmaps/juploadr.png
        install -m644 -D $startdir/src/juploadr.desktop $startdir/pkg/usr/share/applications/juploadr.desktop
        install -m755 -D $startdir/src/juploadr $startdir/pkg/usr/bin/juploadr
    }
elif [ "$CARCH" = "x86_64" ];then
    source=("http://downloads.sourceforge.net/project/juploadr/juploadr/1.1.2/jUploadr-1.1.2-linuxGTK-amd64.tar.gz")
    md5sums=("5a8a2d73e48f13ed88917e50b719048d")
    build(){
        mkdir -p $startdir/pkg/usr/share/juploadr
        cd $startdir/src/jUploadr-1.1.2-linuxGTK-amd64
        cp -r * $startdir/pkg/usr/share/juploadr

        echo "[Desktop Entry]" > ${startdir}/src/juploadr.desktop
        echo "Categories=Application;Graphics;" >> ${startdir}/src/juploadr.desktop
        echo "Comment=Java-GTK Client for uploading/managing photos in a Flickr account" >> ${startdir}/src/juploadr.desktop
        echo "Encoding=UTF-8" >> ${startdir}/src/juploadr.desktop
        echo "Exec=/usr/bin/juploadr" >> ${startdir}/src/juploadr.desktop
        echo "GenericName=juploadr" >> ${startdir}/src/juploadr.desktop
        echo "Hidden=false" >> ${startdir}/src/juploadr.desktop
        echo "Icon=juploadr.png" >> ${startdir}/src/juploadr.desktop
        echo "MimeType=application/vnd.adobe.air-application-installer-package+zip" >> ${startdir}/src/juploadr.desktop
        echo "Name=jUploadr" >> ${startdir}/src/juploadr.desktop
        echo "Terminal=false" >> ${startdir}/src/juploadr.desktop
        echo "Type=Application" >> ${startdir}/src/juploadr.desktop

        echo "#!/bin/sh" > $startdir/src/juploadr
        echo "/usr/share/juploadr/jUploadr" >> $startdir/src/juploadr

        install -m644 -D $startdir/src/jUploadr-1.1.2-linuxGTK-amd64/juploadr_icon.png $startdir/pkg/usr/share/pixmaps/juploadr.png
        install -m644 -D $startdir/src/juploadr.desktop $startdir/pkg/usr/share/applications/juploadr.desktop
        install -m755 -D $startdir/src/juploadr $startdir/pkg/usr/bin/juploadr
    }
fi
