# Maintainer: Amr Hassan <amr.hassan@gmail.com>

pkgname=gedit-csmartindent
pkgver=1.0
pkgrel=0
pkgdesc="Smart indentation plugin for C/C++/Java"
arch=(any)
url="http://live.gnome.org/Gedit/Plugins"
license=('GPL3')
depends=('gedit')
source=("http://live.gnome.org/Gedit/Plugins?action=AttachFile&do=get&target=csmartindent.tar.gz")
md5sums=('0c2df8f9ee1fae865dc23bb0175364e6')
sha512sums=('db2fe8b6fb8e9060fb8a8f35088f87f9ceb7d5da0f4f3f459b87465eb562787951fbc75e0ea3695b76dd68782fcef6d52f10be3c9712bde931514f4cf69b8389')

package() {
  cd "$srcdir"

  install -d "$pkgdir/usr/lib/gedit-2/plugins"
  install -m644 -t "$pkgdir/usr/lib/gedit-2/plugins/" csmartindent.*
}
