# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Thomas Dziedzic <gostrc@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

_pkgname=rhythmbox
pkgname=$_pkgname-old
_pkgver=0.13.3
pkgver=20130106
pkgrel=1
pkgdesc="Old version of Rhythmbox (gtk2)."
arch=(i686 x86_64)
license=(GPL2)
url=http://www.rhythmbox.org
depends=(gtk2 glib2 gconf dbus libxml2 libsoup libsoup-gnome 
    desktop-file-utils gstreamer0.10-good-plugins gstreamer0.10
    gvfs libgnome-media-old libnotify json-glib
    totem-plparser libmusicbrainz3
    )
makedepends=(git autoconf automake gcc pkgconfig 
              gnome-common gtk-doc intltool
              )
optdepends=('gstreamer0.10-ugly-plugins: Extra media codecs'
    'gstreamer0.10-bad-plugins: Extra media codecs'
    'gstreamer0.10-ffmpeg: Extra media codecs'
    )
provides=($_pkgname)
conflicts=($_pkgname)
options=(!strip)
groups=('multimedia')
install=$_pkgname.install

source=('remove_warn.patch')
md5sums=('3d300bef547f8cc9c5ba701b26ac66ee')

_gitroot=git://git.gnome.org/$_pkgname
_gitname=$_pkgname

build() {
    msg "Connecting to GIT server...."
    
    if [[ -d $_gitname/.git ]]; then
        msg "The local files are updated."
    else       
        git clone $_gitroot $_gitname
    fi
    
    msg2 "GIT checkout done or server timeout"

    rm -rf $_gitname-build/
    cp -r $_gitname/ $_gitname-build/
    cd $_gitname-build/
    git checkout "v$_pkgver" 

    msg "Building..."
    patch -Np1 -i ../../remove_warn.patch 
    PYTHON=/usr/bin/python2 WARN_CFLAGS="" ./autogen.sh \
        --prefix=/usr \
        --sysconfdir=/etc \
        --libexecdir=/usr/lib/rhythmbox \
        --localstatedir=/var \
        --disable-static \
        --enable-python \
        --enable-musicbrainz \
        --disable-scrollkeeper \
        --disable-maintainer-mode \
        --disable-uninstalled-build

    make
}

package() {
    cd "$srcdir"/$_gitname-build/
    make DESTDIR="$pkgdir" install
}
