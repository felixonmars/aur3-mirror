# Maintainer: Gadget3000 <Gadget3000@msn.com>
pkgname=ballistics-demo
pkgver=1.2
pkgrel=3
pkgdesc="A futuristic racing game similar to wipeout"
arch=('i686' 'x86_64')
url="http://www.linuxgamepublishing.com/info.php?id=13&"
license=('custom')
if [ "${CARCH}" = "x86_64" ]; then
	depends=('lib32-glibc>=2.1' 'lib32-openal' 'lib32-alsa-lib' 'lib32-zlib' 'lib32-sdl' 'lib32-libxi' 'lib32-gcc-libs' 'lib32-libogg')
else
	depends=('glibc>=2.1')
fi
install=ballistics-demo.install
source=('setup.xml'
        'setup.sh'
        'http://demofiles.linuxgamepublishing.com/ballistics/ballistics-demo.run'
	'ballistics-demo.desktop'
	'ballistics-demo-config.desktop')
md5sums=('708272db3a230796426cf31c91e10163'
         '39494d21bd629ec6f8a932d84b3fc2cb'
         'b49912fb30924ab2532c4c5781bfd4af'
	 'e01d6f188d52787c884c500bc15c29ab'
	 '7e1d9c1a2baf9abcaf7d045afcc9888b')

build() {
  chmod +x ballistics-demo.run
  
  #Extract the installer
  ./ballistics-demo.run --tar xvf -C $srcdir
  
  #Make and copy necessary files and directories
  mkdir -p $pkgdir/usr/bin || return 1
  cp -f $srcdir/../setup.sh $srcdir/ || return 1
  cp -f $srcdir/setup.xml $srcdir/setup.data/ || return 1
  
  #Install
  cd $srcdir/
  ./setup.sh -i ${pkgdir}/opt/ballistics-demo
  
  #Copy and create links to binaries
  cp -f $srcdir/bin/Linux/x86/* $pkgdir/opt/ballistics-demo/ || return 1
  ln -s /opt/ballistics-demo/ballistics_demo /opt/ballistics-demo/ballistics_demo-config ${pkgdir}/usr/bin || return 1
#  rm -r ${pkgdir}/opt/ballistics-demo/lib
  
  install -d ${pkgdir}/usr/share/applications
  cp ${srcdir}/ballistics-demo.desktop ${pkgdir}/usr/share/applications
  cp ${srcdir}/ballistics-demo-config.desktop ${pkgdir}/usr/share/applications
  
  rm -r ${pkgdir}/opt/ballistics-demo/uninstall
  install -D -m644 ${pkgdir}/opt/ballistics-demo/EULA "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
