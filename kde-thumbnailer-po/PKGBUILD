# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Artem Sereda <overmind88@gmail.com>

pkgname=kde-thumbnailer-po
pkgver=2.0
pkgrel=1
pkgdesc="Preview image generator plugin for gnu gettext translation"                                                                                      
arch=('i686' 'x86_64')                                                                    
url="http://kde-apps.org/content/show.php/KDE+PO+Thumbnailer?content=142036"                                                  
license=('GPL')                                                    
depends=('kdebase-workspace' 'gettext')
makedepends=('cmake' 'automoc4')                                                             
source=("${pkgname}-${pkgver}.tar.bz2::http://kde-apps.org/CONTENT/content-files/142036-${pkgname}-${pkgver}.tar.bz2")
sha256sums=('2116672e62ba0f9164c4f03ba2004742ffa6d875fe34dc6def1688672706cb23')

package() {                                                                                                                                                        
 cd ${srcdir}/${pkgname}
 cmake -DCMAKE_INSTALL_PREFIX=/usr                                                           
 make || return 1                                                                            
 make DESTDIR=${pkgdir} install
}