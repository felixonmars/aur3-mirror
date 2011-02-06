# Contributor: tantalum <mail at thaseph.de>
pkgname=guile-gnome-platform
pkgver=2.16.1
pkgrel=2
pkgdesc='Binding between Guile Scheme and the Gnome stack of libraries. (fe. Pango, GTK+, Cairo, GStreamer, Glade, GtkSourceView and else). To build wrappers for GTK+ and higher in the stack, you will first need Guile-Cairo.'
arch=('i686' 'x86_64')
license=('GPL2')
url=http://www.gnu.org/software/guile-gnome/
depends=('guile>=1.6.4' 'g-wrap>=1.9.13' libffi patch)
optdepends=('guile-cairo: cairo bindings' 'guile-gtk: gtk bindings')
source=(
 http://ftp.gnu.org/pub/gnu/guile-gnome/${pkgname}/${pkgname}-${pkgver}.tar.gz
 fix-gtk-2.18-build.patch
)
md5sums=(fde233c17863b7dfbe6937e4b5c00669 f2a0b3a62596b8d467fab7862b1e6151)

build(){
 cd "$pkgname"-"$pkgver" &&
 patch -p0 -i "$srcdir"/../fix-gtk-2.18-build.patch -d gtk || return 1

 ./configure --disable-Werror --prefix=/usr || return 1

 make && make DESTDIR="$pkgdir" install || return 1

 #remove documentation
 if [ -e ${pkgdir}/usr/share/info/dir ]; then
  rm ${pkgdir}/usr/share/info/dir
 fi
}
