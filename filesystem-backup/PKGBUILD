# Contributor: Phillip Smith <fukawi2@NO-SPAM.gmail.com>
pkgname=filesystem-backup
pkgver=0.5.2
pkgrel=1
pkgdesc="Automatic rolling backups to a mounted disk"
arch=(any)
url="http://fukawi2.nl/index.php?page=code-filesystem-backup"
license=('GPL')
depends=(tar coreutils gzip)
backup=('etc/filesystem-backup/backup.exclude' 'etc/filesystem-backup/backup.include' 'etc/filesystem-backup/options.conf')
optdepends=(bzip2)
install=$pkgname.install
source=(filesystem-backup options.conf backup.include backup.exclude)
md5sums=('2a4f54f716ef6929c16ebaa3d66631fe'
         '28ad6f03ecf932b1fff65c4ffa4525ab'
         'aece9dc359346a2592512b958dfef21b'
         'd41d8cd98f00b204e9800998ecf8427e')

build() {
  msg "Nothing to compile for $pkgname"
}

package() {
	install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname || return 1
	install -Dm640 options.conf $pkgdir/etc/$pkgname/options.conf || return 1
	install -Dm640 backup.include $pkgdir/etc/$pkgname/backup.include || return 1
	install -Dm640 backup.exclude $pkgdir/etc/$pkgname/backup.exclude || return 1
}

# vim:set ts=2 sw=2 et:
