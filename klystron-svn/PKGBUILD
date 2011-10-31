# Contributor: Eric Forgeot < http://anamnese.online.fr >

pkgname=klystron-svn
pkgver=354
pkgrel=1
pkgdesc="A framework for a Thrust clone"
arch=('i686' 'x86_64')
url="http://code.google.com/p/klystron/"
license=('MIT')
depends=('sdl')
provides=('klystron')

_svntrunk='http://klystron.googlecode.com/svn/trunk/'
_svnmod='klystron-read-only'




build() {
	cd $startdir/
	
if [ -d "${_svnmod}/.svn" ]; then
    (cd "$_svnmod" && svn up -r $pkgver)
  else
    svn co "$_svntrunk" --config-dir ./ -r $pkgver $_svnmod
  fi

  msg 'SVN checkout done or server timeout'
  msg 'Starting make...'

  rm -rf "${_svnmod}-build"
  cp -r "$_svnmod" "${_svnmod}-build"
  cd "${_svnmod}-build"
  
	make


	mkdir -p $startdir/pkg/usr/share/klystron
	
}

package() {
  cp -fr $startdir/${_svnmod}-build/bin.debug/ $startdir/pkg/usr/share/klystron
  cp -fr $startdir/${_svnmod}-build/src/ $startdir/pkg/usr/share/klystron
  cp -fr $startdir/${_svnmod}-build/tools/ $startdir/pkg/usr/share/klystron
  cp -fr $startdir/${_svnmod}-build/deps/ $startdir/pkg/usr/share/klystron
  cp -fr $startdir/${_svnmod}-build/Makefile $startdir/pkg/usr/share/klystron
}
