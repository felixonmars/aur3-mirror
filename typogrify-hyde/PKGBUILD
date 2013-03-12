# Contributor: Axilleas P <markelos@archlinux.gr>

pkgname=typogrify-hyde
pkgver=1.0.1a
pkgrel=3
pkgdesc="Typography related template filters for Django & Jinja2 applications"
url="https://github.com/hyde/typogrify"
license=('BSD')
arch=(any)
depends=('python2-django>=1.0' 'python2-smartypants>=1.6')
makedepends=('python2' 'git')
conflicts=('typogrify')


_gitroot="git://github.com/hyde/typogrify.git"
_gitname="typogrify-hyde"

build() {

 cd $srcdir
  msg "Connecting to the GIT server...."

  if [[ -d $srcdir/$_gitname ]] ; then
    cd $_gitname
    git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done"
  msg "Starting make..."

  git clone $srcdir/$_gitname $srcdir/$_gitname-build
  cd $srcdir/$_gitname-build

   
  #hyde expects typogrify-hyde 
   sed -i "s/name='typogrify'/name='typogrify-hyde'/" setup.py
   python2 setup.py install --root="${pkgdir}" -O1
  
}
