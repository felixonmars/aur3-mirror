#Contributor: Mario St-Gelais <mario.stg@sympatico.ca>

pkgname=boa-constructor
pkgver=0.6.1
pkgrel=4    
pkgdesc="Cross platform Python IDE and wxPython GUI Builder"
url="http://boa-constructor.sourceforge.net/"
depends=('python2' 'wxpython')
arch=('i686' 'x86_64')
license=('GPL')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-0.6.1.src.zip" "$pkgname.desktop" "boa-constructor.png" "remove-NO_3D.patch")
md5sums=('150d923c608a405eeb17bf655ce26b14' 'c1ef90cc06dadd62f87113f4b3cbd6cc' '51814882beb4f371bb99d586ad6ffcb9' '4974fe1679e09650e13bea1ab2aa1d70')

prepare() {
  cd "$srcdir"
  ls
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 -i ../remove-NO_3D.patch
}

function installDirRecursive {
  dir=`pwd`
  list=`find $1 | paste`
  for f in $list; do \
    if [ -f "$f" ]; then
       filerelpath=${f#"$1"}
       install -D -m644 "$f" "$2$filerelpath"
    fi
  done

  cd $dir
}


package() {
  #Hack to get the correct python install location (thanks phrakture)
  _PYVER=`python2 -V 2>&1`
  _PYVER=${_PYVER##*\ } 
  _PYVER=${_PYVER%.*}
  
  _DESTDIR=/usr/lib/python$_PYVER/site-packages/$pkgname

  mkdir -p $pkgdir/$_DESTDIR
  echo $pkgdir
  installDirRecursive "$srcdir/$pkgname-$pkgver" "$pkgdir/$_DESTDIR"

  cd $srcdir/$pkgname-$pkgver
  #echo "Exec=python $_DESTDIR/Boa.py" >> $startdir/src/$pkgname.desktop
  install -D -m644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  
  mkdir -p $pkgdir/usr/share/pixmaps/
  install -D -m644 "$srcdir/boa-constructor.png" "$pkgdir/usr/share/pixmaps/boa-constructor.png"

  mkdir -p $pkgdir/usr/bin/
  echo "python2 /usr/lib/python$_PYVER/site-packages/boa-constructor/Boa.py" > $pkgdir/usr/bin/boa-constructor
  chmod 755 $pkgdir/usr/bin/boa-constructor

}

