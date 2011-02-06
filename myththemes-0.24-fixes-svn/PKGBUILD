# Maintainer: Jannik Sost <jannik.sost at gmail.com>
# Contributor: Jonathan Conder <jonno.conder@gmail.com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Juergen Hoetzel <juergen@archlinux.org> 
# Contributor: kleptophobiac@gmail.com

pkgname=myththemes-0.24-fixes-svn
pkgver=27405
pkgrel=2
pkgdesc="Themes for MythTV"
arch=('any')
url="http://www.mythtv.org/"
license=('GPL')
depends=("mythtv-0.24-fixes-svn")
conflicts=('myththemes')
provides=('myththemes')
options=('force')
source=()
md5sums=()

_svntrunk="http://code.mythtv.org/svn/branches/release-0-24-fixes/myththemes"                                                                                                                        
_svnmod=myththemes

build() {
  cd "$srcdir"                                                                                                                          
                                                                                                                                        
  if [ -d $_svnmod/.svn ]; then                                                                                                         
    (cd $_svnmod && svn up -r $pkgver)                                                                                                  
  else                                                                                                                                  
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod                                                                               
  fi                                                                                                                                    
                                                                                                                                        
  msg "SVN checkout done or server timeout"                                                                                             
  msg "Starting make..."                                                                                                                
                                                                                                                                        
  rm -rf "$srcdir/$_svnmod-build"                                                                                                       
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"                                                                                     
  cd "$srcdir/$_svnmod-build"

  ./configure --prefix=/usr
  make INSTALL_ROOT="$pkgdir" install
}
