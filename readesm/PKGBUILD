      # Maintainer: lemust83 <lemust83420@gmail.com>
        pkgname=readesm
        pkgver=2
        pkgrel=1
        pkgdesc="lire le contenu de sa carte chronotachygraphe dans un format humain"
        arch=(i686 x86_64)
        url="http://readesm.sourceforge.net/help.html"
        license=('GPL')
        groups=()
        depends=('boost' 'gmp' 'libgcrypt' 'qt4' 'qtwebkit' 'python2')
        makedepends=('cmake' 'subversion')
        replaces=(readesm)
        source=(readesm-code::svn://svn.code.sf.net/p/readesm/code)
        noextract=
        md5sums=('SKIP')




        build() {
          cd $srcdir/readesm-code/fileformat
          python2 ./generate.py
          cd ..
          mkdir build
          cd build
          cmake ..
          make
         }

        package ()
       {
        cd "$srcdir/$pkgname-code/build"
        make DESTDIR="$pkgdir" install
       }
