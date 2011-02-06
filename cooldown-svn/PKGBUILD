# Contributor: Jozef Korencik <joffko@gmail.com>
# Maintainer: Dany Martineau <dany.luc.martineau at gmail.com>

pkgname=cooldown-svn
pkgver=24
pkgrel=1
pkgdesc="Casual game where you need to use both your mind and your reflexes"
arch=('i686' 'x86_64')
url="http://code.google.com/p/cooldown-game/"
license=('GPL')
depends=('sdl')
makedepends=('make')
md5sums=('9486f8569608b80725b4d09c20cb0756')
source=(cooldown.desktop)
_svntrunk=http://cooldown-game.googlecode.com/svn/trunk/
_svnmod=cooldown

build() {
  cd ${srcdir}

  if [ -d ${_svnmod}/.svn ]; then
    (cd ${_svnmod} && svn revert -R .)
    (cd ${_svnmod} && svn -r ${pkgver} up)
  else
    svn co ${_svntrunk} --config-dir ./ -r ${pkgver} ${_svnmod}
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cd ${srcdir}/${_svnmod} 

  cmake -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_SKIP_RPATH=ON
  make
}

package() {
   cd ${srcdir}/${_svnmod} 
   mkdir -p ${pkgdir}/usr/share/{cooldown,applications}
   cp -fR {cooldown,CoolDown.ini} ${pkgdir}/usr/share/cooldown
   cp -fR data/* ${pkgdir}/usr/share/cooldown
   install ../cooldown.desktop ${pkgdir}/usr/share/applications
   mkdir -p ${pkgdir}/usr/bin
   echo "cd '/usr/share/cooldown/' && ./cooldown" > ${pkgdir}/usr/bin/cooldown.sh
   chmod a+x ${pkgdir}/usr/bin/cooldown.sh
   chmod 777 ${pkgdir}/usr/share/cooldown/CoolDown.ini
}