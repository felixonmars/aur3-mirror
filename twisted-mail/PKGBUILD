# Contributor: Michal Krenek <mikos@sg1.cz>
# Contributor: Lex Black <autumn-wind at web dot de>

pkgname=twisted-mail
pkgver=13.2.0
_pkgvershort=13.2
_pkgnamereal=TwistedMail
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="SMTP, POP3, and IMAP4 protocol implementation together with clients and servers"
url="http://twistedmatrix.com/trac/wiki"
license="MIT"
#depends=('twisted-core')
depends=('twisted')
source=(http://twistedmatrix.com/Releases/Mail/$_pkgvershort/$_pkgnamereal-$pkgver.tar.bz2)
md5sums=('2f7a4a55d5c2b9024d3642363d0d1623')

build() {
  cd $srcdir/$_pkgnamereal-$pkgver
  python2 setup.py install --prefix=/usr --root=$pkgdir
}


