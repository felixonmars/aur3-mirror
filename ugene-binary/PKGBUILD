# Maintainer: Giorgio Gilestro <gilest.ro>
pkgname=ugene-binary
pkgver=1.15.1
pkgrel=1
pkgdesc="A free cross-platform genome analysis suite. Precompiled version."
arch=('i686' 'x86_64')
url="http://ugene.unipro.ru"
license=('GPL')
depends=('qt4' 'mesa')
provides=('ugene')

source=( "${url}/downloads/ugene-$pkgver-x86-full.tar.gz"
         "${url}/downloads/ugene-${pkgver}-x86-64-full.tar.gz"
         "ugene.desktop"
         "ugene.sh"
         "ugene.svg"
         )
         
md5sums=('81c26238e052f2977193c19b70da6914'
         '2044b86216327d26544ff8c8fd6e6372'
         '28a763a5808f5e2cb77a9550835cb5e6'
         'fea649663092f4df254fd5ace3d4ec39'
         'c65d205b7200e13910ceae9aa989bdc2')

if   [ "$CARCH" == 'i686' ]; then
	source=( "${url}/downloads/ugene-$pkgver-x86-full.tar.gz"
		 "ugene.desktop"
		 "ugene.sh"
		 "ugene.svg"
		 )
		 
	md5sums=('81c26238e052f2977193c19b70da6914'
		 '28a763a5808f5e2cb77a9550835cb5e6'
		 'fea649663092f4df254fd5ace3d4ec39'
		 'c65d205b7200e13910ceae9aa989bdc2')

elif [ "$CARCH" == 'x86_64' ]; then

	source=( "${url}/downloads/ugene-${pkgver}-x86-64-full.tar.gz"
		 "ugene.desktop"
		 "ugene.sh"
		 "ugene.svg"
		 )
		 
	md5sums=('2044b86216327d26544ff8c8fd6e6372'
		 '28a763a5808f5e2cb77a9550835cb5e6'
		 'fea649663092f4df254fd5ace3d4ec39'
		 'c65d205b7200e13910ceae9aa989bdc2')

fi


package() {
  install -d $pkgdir/usr/bin
  install -d $pkgdir/usr/share/{applications,ugene,man}

  cd $srcdir
  install ugene.desktop $pkgdir/usr/share/applications/
  install -m755 ugene.sh $pkgdir/usr/bin/ugene
  install ugene.svg $pkgdir/usr/share/ugene/

  cd $srcdir/ugene-$pkgver/
  mv man1 $pkgdir/usr/share/man/
  cp -ra * $pkgdir/usr/share/ugene/
  
}


