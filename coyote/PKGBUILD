# Contributor: Nikita "dragon_djanic" Bukhvostov <dragon.djanic@gmail.com>

# ------------------------------------------------------------------ Package Description
pkgname=coyote
pkgver=0.3.0.2_sms_0.8.0.1
pkgrel=3
pkgdesc="That program for sending SMS on mobile phones many operators via internet."
url="http://www.cwer.ru/coyote_0_3_0_2"
arch=('i686' 'x86_64')
license="GPL" 

# ------------------------------------------------------------------ Package Management
depends=('tcl' 'tk' 'tcllib' 'bwidget' 'curl' 'openssl') 

# ------------------------------------------------------------------ Files or Repository
source=(http://www.cwer.ru/files/coyote_$pkgver.tar.gz
	coyote) 
md5sums=('dc91481a5419b7df82a9a5469be02f1f'\
         '1a79e5a7974eddf7ee57bf3cad3578e2')

# ------------------------------------------------------------------ Build and Instalation
build() {
  cd $startdir/src/Coyote
  
  mkdir -p $startdir/pkg/opt/Coyote/bin
  install -m755 bin/* \
  	$startdir/pkg/opt/Coyote/bin
  
  mkdir -p $startdir/pkg/opt/Coyote/lang
  install -D -m644 lang/* \
  	$startdir/pkg/opt/Coyote/lang

  mkdir -p $startdir/pkg/opt/Coyote/lib
  cp -a lib/* \
  	$startdir/pkg/opt/Coyote/lib

  mkdir -p $startdir/pkg/opt/Coyote/plugins
  cp -a plugins/* \
  	$startdir/pkg/opt/Coyote/plugins

  mkdir -p $startdir/pkg/opt/Coyote/update
  
  install -D -m755 ./$pkgname.sh \
  	$startdir/pkg/opt/Coyote
  install -D -m644 ./dplugs.tcl \
  	$startdir/pkg/opt/Coyote
  install -D -m755 ./main.tcl \
  	$startdir/pkg/opt/Coyote
 
  install -D -m755 $startdir/$pkgname \
  	$startdir/pkg/usr/bin/$pkgname
}

