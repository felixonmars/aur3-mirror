# Contributor: Christoph Zeiler <rabyteNOSPAM _at_ gmx.d0t.net>

pkgname=gamebook-engine
pkgver=0.1.4
pkgrel=2
pkgdesc='A free engine for reading gamebooks using the "Hyena" format'
arch=('i686' 'x86_64')
url="http://www.freegameengines.org/$pkgname/"
license=('GPL')
depends=('lua>=5.1' 'qt>=4.4')
source=(http://www.projectaon.org/staff/brandon/$pkgname-src-$pkgver.tar.gz)
md5sums=('fc6ec9fc0a6efb20732cc1fa37dcb6cc')
sha1sums=('abe2278e78a51fe3fa4c4bab66250dc86eb385c4')

build() {
  cd $pkgname-src-$pkgver

  sed 's|moc-qt4|moc|g ; s|lua5.1|lua|g' -i Makefile

  make	CXXFLAGS="${CXXFLAGS}" \
	QT_INC_PREFIX=/usr/include \
	DEBUG_OPT= \
	|| return 1

  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname

  mkdir -p "$pkgdir"/usr/share/$pkgname
  install -Dm644 gamebooks/01fftd/01fftd.gamebook "$pkgdir"/usr/share/$pkgname/fftd.gamebook
  install -m644 gamebooks/ring-of-thieves.gamebook "$pkgdir"/usr/share/$pkgname/rot.gamebook

  for book in fftd rot; do
	echo "/usr/bin/$pkgname /usr/share/$pkgname/$book.gamebook \"\$@\"" \
		> "$pkgdir"/usr/bin/$pkgname-$book
	chmod 755 "$pkgdir"/usr/bin/$pkgname-$book
  done
}

# vim:set ts=2 sw=2 et:
