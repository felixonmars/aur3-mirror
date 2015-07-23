# Maintainer: 404
# Contributor: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: Axilleas P <axilleas archlinux info>
# Contributor:  <clu>
# Contributor: !org!sdf!jboy

pkgname=hyde
pkgver=0.8.8
pkgrel=2
pkgdesc="A static website generator written in Python"
arch=('any')
url="http://hyde.github.io"
license=('MIT')
depends=('python2-jinja' 'python2-smartypants' 'python2-fswrap' 'python2-yaml'
         'python2-typogrify' 'python2-commando'  'python2-pygments'
         'python2-markdown' 'python2-markupsafe')
makedepends=('python2-setuptools')
conflicts=('hyde-git')
source=("https://pypi.python.org/packages/source/h/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('4c6bc45c2c82e0f11fc7c09ac6284532a71f31fdaa07782c79cf355e3cadb1e6')

prepare() {
  cd $pkgname-$pkgver

  # python2 shebang
  sed 's|env python$|&2|' -i hyde/main.py

  # dependencies
  sed 's|Pygments==1.6|Pygments==2.0.2|' -i setup.py
  sed 's|typogrify==2.0.0|typogrify==2.0.7|' -i setup.py
  sed 's|Jinja2==2.7.1|Jinja2==2.7.3|' -i setup.py
  sed 's|Markdown==2.3.1|Markdown==2.6.2|' -i setup.py
  sed 's|MarkupSafe==0.18|MarkupSafe==0.23|' -i setup.py
  sed 's|PyYAML==3.10|PyYAML==3.11|' -i setup.py
  sed 's|smartypants<1.8|smartypants==1.8.6|' -i setup.py
}

package() {
  cd $pkgname-$pkgver

  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
