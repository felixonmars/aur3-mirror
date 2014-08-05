      # Maintainer: lemust83 <lemust83420@gmail.com>
        pkgname=readesm-fr.2.3
        pkgver=2
        pkgrel=3
        pkgdesc="lire les fichiers Tachographs issus de Cardpeek ou autres  dans un format humainement compréhensible"
        arch=(i686 x86_64)
        url="http://readesm.sourceforge.net/help.html"
        license=('GPL')
        groups=()
        depends=('boost' 'gmp' 'libgcrypt' 'qt4' 'qtwebkit' 'python2')
        makedepends=('cmake')
        replaces=(readesm )
        source=(http://switch.dl.sourceforge.net/project/readesmfr/readesm-fr/readesm-fr.2.3.tar.gz)
        noextract=
        md5sums=(2e07343e4bb3c31b888e5aa36ac546cd)




        build() {
          cd $srcdir/readesm-fr.2.3/fileformat
          python2 ./generate.py
          cd ..
          mkdir build
          cd build
          cmake ..
          make
         }

        package ()
       {
        cd "$srcdir/$pkgname/build"
        make DESTDIR="$pkgdir" install
       }

