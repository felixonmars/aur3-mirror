# Maintainer: tomx3 <mail@tomtomtom.org>
pkgname=tux-navi
pkgver=3.4
pkgrel=1
pkgdesc="Easy and fast filebrowser with advanced previews including metadata"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://tux-navi.org/tux-navi/index.html"
depends=('brightside' 'cairo-ubuntu' 'libexif' 'ffmpegthumbnailer' 'findutils' 'mplayer' 'perl-image-exiftool' 'poppler-glib' 'procps-ng' 'python-pyxattr' 'tar' 'unrar' 
'unzip' 'webkitgtk' 'wmctrl' 'xdotool' 'zenity')
makedepends=('attr' 'poppler-glib' 'tar' 'webkitgtk' 'wget')
optdepends=('gnome-screensaver' 'gnome-session' 'gnome-web-photo')
source=("http://tux-navi.org/tux-navi/tux-navi_3.4-1_src.tgz") 
md5sums=('18ecf616a82cf60f0576780fcc77098d')

build() {
 tar -xf tux-navi_3.4-1_src.tgz
 cd tux-navi
 ./create_it
}



package(){
 mkdir -p $pkgdir/usr/bin
 cp "$srcdir/$pkgname/tux-navi" "$pkgdir/usr/bin/tux-navi"
 chmod -R 755  $pkgdir/usr/bin/tux-navi
}
