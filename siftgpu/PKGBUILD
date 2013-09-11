# Contributor: josedavim <josedtascon@gmail.com>

pkgname=siftgpu
pkgver=0.5.400
pkgrel=1
pkgdesc="Sift Features over GPU using GLSL or CUDA"
arch=('i686' 'x86_64')
url="http://cs.unc.edu/~ccwu/siftgpu/"
license=('custom')
makedepends=('gcc-libs')
depends=('glew>=1.8' 'freeglut>=2.7' 'devil>=1.7')
optdepends=('cuda>=5.0')
source=('http://wwwx.cs.unc.edu/~ccwu/cgi-bin/siftgpu.cgi')
md5sums=('ca79e636c38bc40bd7886d5d389dfcd7')

if [ "${CARCH}" = "x86_64" ]; then
  _platform=x64
else
  _platform=x86
fi

folder=SiftGPU

build() {
  cd "$srcdir/$folder"
  rm -r include/GL/glew.h
  rm -r include/GL/wglew.h
  rm -r include/GL/glut.h
  rm -r include/IL/il.h
  sed -i -e's/siftgpu_prefer_glut = 0/siftgpu_prefer_glut = 1/' makefile
  #./configure --localstatedir=/var --prefix=/usr --sysconfdir=/etc 
  make
}

package ()
{
  cd "$srcdir/$folder"
  mkdir -p $pkgdir/usr/lib
  mkdir -p $pkgdir/usr/include
  cp -a ./bin/libsiftgpu.so ./bin/libsiftgpu.a $pkgdir/usr/lib
  cp -a ./src/$folder/SiftGPU.h $pkgdir/usr/include
  install -Dm644 ./license.txt "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}
