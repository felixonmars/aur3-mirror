# Maintainer: Alexander De Sousa <archaur.xandy21@spamgourmet.com>
# Contributor: N30N <archlinux@alunamation.com>

pkgname=gtk-theme-drakfire-black
pkgver=0.6.2
pkgrel=2
pkgdesc='Drakfire Black theme.'
arch=('any')
url='http://gnome-look.org/content/show.php/Drakfire+Black?content=135009'
license=('GPL')
depends=('gtk-engine-murrine' 'gtk-aurora-engine')
optdepends=('awoken-icons: default icon set to use with this theme.')
source=('http://dl.dropbox.com/u/1106169/drakfire black/Drakfire Black 0.6-2.tar.gz')
md5sums=('b3656262256cec5c4ba9eaa3c67fbc85')
sha1sums=('5d2d9abc4cdef9b39f93ca4142e1bb1e525f4146')

package() {
	find 'Drakfire Black' ! -type d -exec \
		install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}

# vim: set ft=sh ts=3 sw=3 tw=0:
