#Contributor: funkyou <spamopfer@nickname.berlin.de>
pkgname=exscalibar 
pkgver=1.0.4 
pkgrel=2 
pkgdesc="Exscalibar is an EXtendable, SCalable Architecture for Live, Interactive or Batch-orientated Audio-signal Refinement." 
url="http://www.sf.net/projects/exscalibar" 
license="GPL" 
depends=('qt' 'fftw' 'libsndfile' 'libvorbis' 'libmad')
makedepends=() 
conflicts=() 
replaces=() 
backup=() 
install= 
source=(http://dl.sourceforge.net/sourceforge/exscalibar/$pkgname-$pkgver.tar.bz2) 
md5sums=('3b0abeb7648d3732e5f4702c4a2be4ab') 

build() { 
	        cd $startdir/src/$pkgname-$pkgver 
		        EXSCALIBAR_LOCATION=$startdir/pkg/opt/qt  ./configure 
			        make || return 1 
				        make install 
				}
