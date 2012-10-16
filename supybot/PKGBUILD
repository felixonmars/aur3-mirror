# Maintainer: Carl Reinke <mindless2112 gmail com>
# Contributor: Aaron Griffin <aaron@archlinux.org>

pkgname=supybot
pkgver=0.83.4.1
pkgrel=4
pkgdesc="A flexible, easy-to-use IRC bot written in Python"
url="http://supybot.com"
arch=(i686 x86_64)
license=('custom')
depends=('python2>=2.5' 'python2-pysqlite-legacy' 'twisted')
optdepends=('python2-pyopenssl: SSL server support')
source=(http://downloads.sourceforge.net/sourceforge/supybot/Supybot-$pkgver.tar.bz2)
md5sums=('96ce90559c7d6fde5e3c93174c509408')

package()
{
    cd $srcdir/Supybot-$pkgver/
    python2 setup.py install --root=$pkgdir

    mkdir -p $pkgdir/usr/share/licenses/supybot/
    install -m644 LICENSE $pkgdir/usr/share/licenses/supybot/
}
