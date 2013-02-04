# Maintainer: Dennis Fink <the_metalgamer@hackerspace.lu>

pkgname=acrylamid2
pkgver=0.5.0
pkgrel=1
pkgdesc="static blog generator in python with incremental rendering. Python2 version "
arch=('any')
url="http://posativ.org/acrylamid/"
license=('BSD')
depends=('python2>=2.6' 'python2-jinja>=2.4' 'python2-markdown>=2.0.1' 'python2-translitcodec>=0.2')
makedepends=('git')
optdepends=('python2-pygments: Syntax Highlighting'
'python2-docutils: reStructuredText'
'python2-smartypants: Typography enhancements'
'python2-asciimathml: AsciiMathML to MathML'
'python2-unidecode: cyrillic/chinese ascii slugs'
'python2-textile: Textile'
'python2-yaml: exact YAML parser'
'python2-twitter-tools: Twitter'
'discount: Discount'
'python2-mako: Mako Templating'
)
conflicts=('acrylamid2-git')

build() {

  _gitroot="git://github.com/posativ/acrylamid.git"
  _gitname="acrylamid"
  _tagname="0.5.0"

  cd "$srcdir"
  msg "Connecting to Git server..."

  if [ -d "$_gitname" ]; then
    cd "$_gitname" && git pull origin
    cd "$srcdir"
    msg "The local file are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  cd "$srcdir/${_gitname}"
  git fetch --tags ${_gitroot}
  git checkout ${_tagname}

  msg "Git checkout done or server timeout"
  msg "Starting make"

  cd "$srcdir/$_gitname"
  python2 setup.py build
  python2 setup.py install --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
