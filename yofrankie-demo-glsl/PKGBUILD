# Maintainer: Gadget3000 <gadget3000 at msn dot com>
# Contributor: Martin Pieuchot 

pkgname=yofrankie-demo-glsl
_pkgname=yofrankie_demo1.2_glsl
pkgver=1.2
pkgrel=2
pkgdesc="Open source computer game by the Blender Institute" 
arch=('i686' 'x86_64')
url="http://www.yofrankie.org/" 
license=('CCPL')
depends=('mesa' 'libjpeg6' 'libxi' 'libpng12' 'sdl')
if [ "$CARCH" = "x86_64" ]; then
	source=(http://download.blender.org/apricot/demo/${_pkgname}_linux64.tar.gz
  		yofrankie)
	md5sums=('d9613d3501528f9e041964f677d577d0'
           	 '415e90f71dc9d78c522cb66741f7030f')
else
	source=(http://download.blender.org/apricot/demo/${_pkgname}_linux32.tar.gz
        	yofrankie)
	md5sums=('fd1ad0dda4e284e75eea36493ac61860'
		 '415e90f71dc9d78c522cb66741f7030f')
fi

build() { 
  mkdir -p ${pkgdir}/opt/yofrankie/

  cp -rPf ${srcdir}/${_pkgname}_$(echo $source | rev | cut -d "_" -f 1 | rev | cut -d "." -f 1)/* ${pkgdir}/opt/yofrankie/
  install -m 755 -D yofrankie ${pkgdir}/usr/bin/yofrankie
}
