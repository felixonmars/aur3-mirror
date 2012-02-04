# Maintainer: Romain Schmitz <myself at slopjong dot de>
pkgname=redmine-gchart-formula-git
pkgver=20120125
pkgrel=1
pkgdesc="Capability to render LaTeX formulas in the redmine wiki"
arch=('any')
url="https://github.com/masamitsu-murase/redmine_wiki_gchart_formula"
license=('MIT')
depends=( 'ruby-redmine>=1.2.0')
makedepends=('git')
install=redmine-gchart-formula.install

_gitroot="git://github.com/masamitsu-murase/redmine_wiki_gchart_formula.git"
_gitname="wiki_gchart_formula"

build() {

  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
}

package(){
	
   mkdir -p "$pkgdir/var/lib/redmine/vendor/plugins"
   mkdir -p "$pkgdir/usr/share/licenses/$_gitname"
   cp -R "$srcdir/$_gitname" "$pkgdir/var/lib/redmine/vendor/plugins"

  # the upstream is missing a proper license file, so it's created here:
  cat > "$pkgdir/usr/share/licenses/$_gitname/LICENSE" <<EOF
Copyright (C) 2011-2012 Masamitsu Murase

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
EOF

}
