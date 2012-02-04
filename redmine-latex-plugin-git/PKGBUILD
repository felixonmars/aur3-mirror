# Maintainer: Romain Schmitz <myself at slopjong dot de>
pkgname=redmine-latex-plugin-git
pkgver=20120125
pkgrel=1
pkgdesc="Capability to render LaTeX formulas in the redmine wiki"
arch=('i686' 'x86_64')
url="http://github.com/nisrael/redmine-wiki_latex_plugin/"
license=('GPL2')
depends=( 'ruby-redmine>=1.2.0')
makedepends=('git')

_gitroot="git://github.com/nisrael/redmine-wiki_latex_plugin.git"
_gitname="redmine-wiki_latex_plugin"

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
  chown -R redmine:redmine "$srcdir/$_gitname"
}

package(){
	
   mkdir -p "$pkgdir/var/lib/redmine/vendor/plugins"
   cp -R "$srcdir/$_gitname" "$pkgdir/var/lib/redmine/vendor/plugins"
}
