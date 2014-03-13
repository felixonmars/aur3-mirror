# Maintainer: Jean-Noël Rouchon <mail@mithril.re>

pkgname=agritux
pkgver=0.4.4
pkgrel=2
pkgdesc="Logiciel de gestion d'exploitations agricoles"
arch=('any')
url="http://agritux.net"
license=('GPL3')
url='http://agritux.net'
depends=('ruby' 
				 'postgresql-libs' 
				 'sqlite' 
				 'ruby-activerecord'
				 'ruby-gtk2'
				 'ruby-bcrypt'
				 'ruby-prawn'
				 'ruby-ezcrypto'
				 'ruby-r18n-desktop'
				 'ruby-pg'
				 'ruby-sqlite3'
				 )
options=()

source=('http://public.mithril.re/agritux/agritux-0.4.4.tar.gz')
md5sums=('87aa06726273168501c0d9885d129f6f')

package() {
  cd ${srcdir}/$pkgname-$pkgver
  install -D -m755 agritux $pkgdir/usr/bin/agritux
  install -D -m755 agritux.desktop $pkgdir/usr/share/applications/agritux.desktop
  install -dm755 $pkgdir/usr/share/$pkgname/src/resources/articles
  install -dm755 $pkgdir/usr/share/$pkgname/src/resources/cultures
  install -dm755 $pkgdir/usr/share/$pkgname/src/resources/fonts
  install -dm755 $pkgdir/usr/share/$pkgname/src/resources/icons
  install -dm755 $pkgdir/usr/share/$pkgname/src/resources/images
  install -dm755 $pkgdir/usr/share/$pkgname/src/i18n
  install -dm755 $pkgdir/usr/share/$pkgname/db/migrate
  install -D -m644 Rakefile $pkgdir/usr/share/$pkgname/
  install -D -m644 src/*.* $pkgdir/usr/share/$pkgname/src/
  install -D -m644 src/resources/articles/*.* $pkgdir/usr/share/$pkgname/src/resources/articles/
  install -D -m644 src/resources/fonts/*.* $pkgdir/usr/share/$pkgname/src/resources/fonts/
  install -D -m644 src/resources/icons/*.* $pkgdir/usr/share/$pkgname/src/resources/icons/
  install -D -m644 src/i18n/*.* $pkgdir/usr/share/$pkgname/src/i18n/
  install -D -m644 db/*.* $pkgdir/usr/share/$pkgname/db/
  install -D -m644 db/migrate/*.* $pkgdir/usr/share/$pkgname/db/migrate/
  install -D -m644 LICENSE $pkgdir/usr/share/$pkgname/
}
