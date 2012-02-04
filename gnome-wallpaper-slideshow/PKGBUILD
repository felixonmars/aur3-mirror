# Maintainer Thomas Schneider <maxmusterm@gmail.com>
pkgname="gnome-wallpaper-slideshow"
pkgver=1.02
pkgrel=1
arch=('i686')
license="GPL3"
url="http://code.google.com/p/gnome-wallpaper-slideshow/"
pkgdesc="A simple utility written in Python and GTK+ to create a backgrounds.xml file from a folder of images and set it as the current desktop wallpaper."
source=("http://gnome-wallpaper-slideshow.googlecode.com/files/gnome-wallpaper-slideshow-1.02.tar.gz")
md5sums=('93be14dfdeaacf8ba6483471a4f4dc7e')

build(){
cd ${srcdir}
mkdir -p ${pkgdir}/usr/bin
sed -i 's/python/python2.7/' gnome-wallpaper-slideshow
cp gnome-wallpaper-slideshow ${pkgdir}/usr/bin
}
