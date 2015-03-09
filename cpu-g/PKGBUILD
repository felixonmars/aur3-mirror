# Maintainer: Oliver Wiedemann <crxxn at tinkershack dot org>
# Contributor: muflone                                                           
# Contributor: louie23
pkgname=cpu-g                                                                   
pkgver=0.9.0                                                                    
pkgrel=5                                                                        
pkgdesc="A Linux version of CPU-Z. Displays CPU, RAM and mainboard info."          
url=('http://cpug.sourceforge.net')                                             
arch=('any')                                                                    
license=('GPL')                                                                 
depends=('python2' 'pygtk' 'xdg-utils')                                         
source=(http://downloads.sourceforge.net/cpug/$pkgname-$pkgver.tar.gz cpu-g cpu-g.patch)    
sha512sums=(
	'ec38cb8edb85c086b239bb510622084256196ae7e15e770d666b118f76ba3fe9745882668e8699589d05bb8a315d84eabcda63d8332e4fde53bad33b42eb1152'
	'd52bd0d03e3fef1b654ddd7057374ac92914f3e617259dc5d9eb7d9f0e66f11d2209de64f22b0cf3428d78641d65bbd8e44dc9bb483f70a5c7081352d012a237'
	'971082ec93af34bd7faaafc38ca058a25cfed28ac3ebee651121df31138c935083e6a1a342210ae66706f6611a3c5a5f9c9d6eef0d00e2d507f7ee454902ec76'
	 )
                                                                                
package(){                                                                      
   install -d "$pkgdir"/usr/{bin,share}                                         
   install -d "$pkgdir/usr/share/$pkgname"                                      
   install -d "$pkgdir/usr/share/applications"                                  
   install -d "$pkgdir/usr/share/$pkgname/data"                                 
   install -d "$pkgdir/usr/share/$pkgname/data/logos"                           
   install -d "$pkgdir/usr/share/man/man1"                                      
   install -Dm755 cpu-g "$pkgdir/usr/bin/"                                      
   install -Dm644 "$srcdir"/"$pkgname-$pkgver"/{COPYING,README,cpu-g.glade} "$pkgdir/usr/share/$pkgname/"
   install -Dm644 "$srcdir/$pkgname-$pkgver/data/cpu-g.png" "$pkgdir/usr/share/$pkgname/data"
   install -Dm644 "$srcdir/$pkgname-$pkgver/data/logos"/* "$pkgdir/usr/share/$pkgname/data/logos"


   # Apply change python to python2 and fix Xorg version detection
   patch "$srcdir/$pkgname-$pkgver/cpu-g" cpu-g.patch                                                                             

   install -Dm755 "$srcdir/$pkgname-$pkgver/cpu-g" "$pkgdir/usr/share/$pkgname/"



   # Compress and install the man page                                          
   gzip -f9 "$srcdir/$pkgname-$pkgver/doc/cpu-g.1"                              
   install -Dm644 "$srcdir/$pkgname-$pkgver/doc/cpu-g.1.gz" "$pkgdir/usr/share/man/man1/"
                                                                                
   # Fix and install the desktop file                                           
   sed -i "s_^Icon=cpu-g\$_Icon=/usr/share/$pkgname/data/cpu-g.png_" "$srcdir/$pkgname-$pkgver/data/cpu-g.desktop"
   install -Dm644 "$srcdir/$pkgname-$pkgver/data/cpu-g.desktop" "$pkgdir/usr/share/applications/"
}
