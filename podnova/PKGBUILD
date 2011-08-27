# Contributor: Philipp Giebel <arch@ambience-design.net>
pkgname=podnova
pkgver=2.2
pkgrel=2
pkgdesc="A desktop-client for www.podnova.com written in python"
depends=('wxpython' 'python>=2.4' 'pygtk' 'pyxml')
install=podnova.install
source=(	http://dl.sourceforge.net/sourceforge/$pkgname/PodNova-$pkgver-Gnu_Linux.tar.gz \
		ftp://arch.kennmer.net/pkgbuilds/$pkgname-$pkgver-$pkgrel/podnova.xpm
		podnova.desktop )
url="http://www.podnova.com"
license="GPL"
md5sums=(	'2d244ff768fe3e5f6731f013fe60b80f' \
		'bfc600975f8ac89d52b06112ea662a34' \
		'ed1e918da72785dc9457d190255c976f' )

build() {
  cd $startdir/src

  msg "Extracting installation archive"
  tar -zxf PodNova-$pkgver.tar.gz
  
  cd PodNova-$pkgver

  msg "Creating target directories"
  mkdir -p $startdir/pkg/usr/bin
  mkdir -p $startdir/pkg/usr/share/$pkgname-$pkgver

  msg "Copying files to target directory"
  cp -f -R * $startdir/pkg/usr/share/$pkgname-$pkgver

  msg "Creating start-script"
  echo "#!/bin/sh" > $startdir/pkg/usr/share/$pkgname-$pkgver/PodNova.sh
  echo "cd /usr/share/$pkgname-$pkgver" >> $startdir/pkg/usr/share/$pkgname-$pkgver/PodNova.sh
  echo "python iPodderGui.py" >> $startdir/pkg/usr/share/$pkgname-$pkgver/PodNova.sh
  chmod ugo+x $startdir/pkg/usr/share/$pkgname-$pkgver/PodNova.sh
  
  msg "Creating shortcut"
  ln -sf /usr/share/$pkgname-$pkgver/PodNova.sh $startdir/pkg/usr/bin/$pkgname

  msg "Creating startmenu-entry"
  install -D -m644 $startdir/src/podnova.desktop $startdir/pkg/usr/share/applications/podnova.desktop
  install -D -m644 $startdir/src/podnova.xpm $startdir/pkg/usr/share/pixmaps/podnova.xpm
}
