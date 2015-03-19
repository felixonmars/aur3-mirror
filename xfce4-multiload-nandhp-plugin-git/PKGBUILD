# Maintainer: Pierre Carru <pierre.carru@gmail.com>
pkgname=xfce4-multiload-nandhp-plugin-git
pkgver=20130612
pkgrel=2
pkgdesc='Multiload panel plugin for Xfce panel'
arch=('i686' 'x86_64')
url="http://github.com/nandhp/multiload-nandhp"
license=('GPL2')
groups=('xfce4-goodies')
depends=('pacman' 'xfce4-panel>=4.7.4' 'libxfcegui4' 'libgtop')
makedepends=('git' 'intltool')

source=('git://github.com/nandhp/multiload-nandhp.git')
md5sums=('SKIP')

_gitname='multiload-nandhp'

# close stderr to avoid filling journal with glibtop warnings
patch_close_stderr="diff --git a/multiload/multiload.c b/multiload/multiload.c
index b0e67a7..58af0be 100644
--- a/multiload/multiload.c
+++ b/multiload/multiload.c
@@ -171,6 +171,8 @@ multiload_init()
   glibtop *glt = glibtop_init();
   g_assert(glt != NULL);
 
+  close(2);
+
   /* Prepare graph types */
   GraphType temp[] = {
       /* prefs_label       tooltip_label      name       get_data num_colors */"

build() {
    cd $_gitname
    #echo "$patch_close_stderr" | patch -Np1 -N || return 1

    ./autogen.sh
    ./configure --prefix=/usr \
        --enable-fast-install \
        --disable-static \
        --with-xfce4
    make
}

package() {
    cd $_gitname
    make DESTDIR="$pkgdir" install
    rm -f $pkgdir/usr/lib/xfce4/panel/plugins/libmultiload.la
}

