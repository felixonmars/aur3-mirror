# Contributor: Anibal Pacheco <apacheco.uy@gmail.com>
pkgname="scrapy-hg"
pkgver=2495
pkgrel=4
pkgdesc="A fast high-level scraping and web crawling framework - development version."
arch=('i686' 'x86_64')
license=('BSD')
url="http://scrapy.org"
depends=('python2>=2.5' 'twisted>=2.5' 'libxml2>=2.6.28')
makedepends=('mercurial')
optdepends=("pyopenssl: only if you want to crawl secure (HTTPS) pages")
provides=('scrapy')
conflicts=('scrapy')
options=(!emptydirs)

_hgroot=http://hg.scrapy.org/
_hgrepo=scrapy

build() {
  cd ${srcdir}

  if [ -d ${_hgrepo} ]; then
    (cd ${_hgrepo} && hg pull -u)
  else
    hg clone ${_hgroot}/${_hgrepo}
    cd ${_hgrepo}
  fi

  # installation
  cd $srcdir/$_hgrepo
  python2 setup.py install --root=$pkgdir || return 1

  # copying license information
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

  # copying readme information
  install -D -m644 README $pkgdir/usr/share/doc/$pkgname/README
  install -D -m644 INSTALL $pkgdir/usr/share/doc/$pkgname/INSTALL
}
