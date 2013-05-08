# Maintainer: Phillip Smith <fukawi2@NO-SPAM.gmail.com>
# http://github.com/fukawi2/aur-packages
pkgname=rsync-backup
pkgver=0.6.0
pkgrel=1
pkgdesc="Automatic rsync backups to a mounted disk or remote server. DEAD PROJECT. Do not use unless you want to maintain it."
arch=('any')
url="http://example.com"
license=('GPL')
depends=('rsync')
backup=('etc/rsync-backup/backup.exclude' 'etc/rsync-backup/backup.include' 'etc/rsync-backup/options.conf')
install=$pkgname.install
source=('rsync-backup' 'options.conf' 'backup.include' 'backup.exclude')
md5sums=('530d18a212cbcd91a1cb44a8a32202a9'
         'abaa5930ff778988ce48e638e7ffecec'
         '0b7cd74a8cae5d12b10e806d5c92688e'
         '38bcafb88da89eb1e815a7aae146578c')

package() {
	install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
	install -Dm600 options.conf $pkgdir/etc/${pkgname}/options.conf
	install -Dm640 backup.include $pkgdir/etc/${pkgname}/backup.include
	install -Dm640 backup.exclude $pkgdir/etc/${pkgname}/backup.exclude
}

# vim:set ts=2 sw=2 et:
