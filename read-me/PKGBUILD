# Maintainer: Jakub Kozisek <nodevel at gmail dot com>

pkgname=read-me
pkgver=0.2.2.6
pkgrel=2
pkgdesc="A desktop reader for Google Reader"
arch=('i686' 'x86_64')
url="http://www.atareao.es/ubuntu/software-para-tu-ubuntu/google-reader-en-tu-escritorio-de-ubuntu-gracias-a-read-me/"
license=('GPLv3')
depends=('python2-gconf' 'pycrypto' 'pywebkitgtk' 'python-simplejson' 'python2-lxml' 'python2-httplib2')
source=(https://launchpad.net/~atareao/+archive/${pkgname}/+files/${pkgname}_$pkgver-1ubuntu1_all.deb fix-no-unity.patch)

build() {
    msg "Extracting..."
    ar -xv ${pkgname}_${pkgver}-1ubuntu1_all.deb || return 1
    tar -xvf data.tar.gz || return 1
    msg2 "Done extracting!"
    cd usr/share/applications
    echo "Patching Read-Me.desktop"
    sed -i 's|python /usr/share/read-me/read-me.py|python2 /usr/share/read-me/read-me.py|' Read-Me.desktop
    cd ../read-me
#    sed -i 's|settings.props.gtk_button_images = True||' read-me
#    sed -i 's|#! /usr/bin/python|#! /usr/bin/python2|' read-me
    for i in ./*.py; do
      echo "Patching $i"
      sed -i 's|/usr/bin/python$|/usr/bin/python2|' $i
    done
    cd ${srcdir}
    msg "Patching for missing Unity..."
    patch -p1 -i ${srcdir}/fix-no-unity.patch
    cd usr/share/read-me
    chmod +x ./read-me.py
    msg "Moving files"
    mv $srcdir/usr $pkgdir/usr
    msg2 "Done moving files"

}
md5sums=('95e2ea28b44f3f83284850ec6cde2163' '6526059d0e81228a7ba8b8c470a6d403')