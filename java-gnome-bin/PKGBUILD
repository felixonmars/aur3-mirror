# Maintainer: Dan Serban

pkgname=java-gnome-bin
pkgver=4.x.x.latest
pkgrel=1
pkgdesc="Java bindings to the GNOME platform (including gtk, glib and glade)"
arch=(i686 x86_64)
url=http://java-gnome.sourceforge.net/
license=(GPL)
depends=(gtksourceview2 gtkspell java-runtime libglade libnotify libunique)
makedepends=(lynx rpmextract)
_fedora_repo_arch=i386
[ "${CARCH}" == "x86_64" ] && _fedora_repo_arch=x86_64

build()
{
  rm -r usr java-gnome-*.rpm 2>/dev/null || true
  _url_prefix="http://download.fedora.redhat.com/pub/fedora/linux/releases/16/Everything"
  msg "Determining source..."
  _url=$(lynx -dump "${_url_prefix}/${_fedora_repo_arch}/os/Packages/" | grep -o http.*java-gnome-4.*${CARCH}.rpm)
  wget "${_url}"
  rpmextract.sh $(basename ${_url})
  mv usr "${pkgdir}"/
}

