# Maintainer: Hilton Medeiros <medeiros.hilton@gmail.com>

pkgname=dexy
pkgver=0.9.5
pkgrel=1
pkgdesc="A free-form literate documentation tool for writing tech document incorporating code."
arch=('any')
url="http://www.dexy.it"
license=('custom:MIT')
depends=('python2-jinja' 'python2-pexpect' 'python2-pygments' 'zapps'
         'idiopidae' 'python-modargs' 'python2-chardet' 'python2-yaml'
         'python2-requests' 'python2-ordereddict' 'python2-nose'
         'python2-mock')
optdepends=('python2-markdown: for markdown filter plugin'
            'python2-boto: for boto filter plugin'
            'python2-nltk: for nltk filter plugin'
            'python2-beautifulsoup4: for templating plugin')
source=("http://pypi.python.org/packages/source/d/$pkgname/$pkgname-$pkgver.tar.gz"
        LICENSE)
md5sums=('f4e6dfeb839dae423aa728482bb24a0c'
         'ea59651c29c91ac21afcfd78d4495bb2')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir" -O1
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
