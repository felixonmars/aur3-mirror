#Maintainer: Giorgio Gilestro <giorgio@gilest.ro>

pkgname=latex-pubmed
pkgver=20110328
pkgrel=1
pkgdesc="A little environment for citing PubMed IDs with Latex"
arch=('any')
url="https://github.com/nickloman/latex-pubmed"
license=('GPL')
depends=('texlive-core' 'python2' 'py-dom-xpath')
source=('gorefs.py')
md5sums=('75e14134dc4dcb77b45e14aa75b05004')
makedepends=('git')

_gitroot="git://github.com/nickloman/latex-pubmed.git"
_gitname="latex-pubmed"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"

  cd "$srcdir/$_gitname-build"

  mkdir -p $pkgdir/usr/share/latex-pubmed/pyP2B
  mkdir -p $pkgdir/usr/bin

  install accents.py README $pkgdir/usr/share/latex-pubmed/
  install $srcdir/gorefs.py $pkgdir/usr/share/latex-pubmed/
  install pyP2B/* $pkgdir/usr/share/latex-pubmed/pyP2B/
  
  echo "#!/bin/sh
python2 /usr/share/latex-pubmed/gorefs.py \"\$@\"" > $pkgdir/usr/bin/gorefs
  chmod +x $pkgdir/usr/bin/gorefs
  
  
}
