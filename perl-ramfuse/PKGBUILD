pkgname=perl-ramfuse
pkgver=20080216112800
pkgrel=2
pkgdesc='a dynamically growing RAM file system for FUSE'
arch=('i686' 'x86_64')
license=('GPL2')
depends=('perl-fuse')
url=http://notabilis.org/code/?ramfuse
source=('ramfuse.sh'
        'ramfuse.pl'
        'InMemory.pm')

build() {
  install -D -m 555 ramfuse.sh $pkgdir/usr/bin/ramfuse
  install -D -m 444 ramfuse.pl $pkgdir/usr/share/perl-ramfuse/ramfuse.pl
  install -D -m 444 InMemory.pm $pkgdir/usr/share/perl5/vendor_perl/Fuse/InMemory.pm
}
md5sums=('4c1486aa3ceb1b751c2705c14a201886'
         '618a1d5bf9fa2e7568a5a12d76309deb'
         'ba93251df1c29e1326aea7c2f8af4dea')
sha1sums=('146910b91ac65afd1fa7d0d652eda22fee3d7b9e'
          '442912b1d2ef3b010fef9a28ef84599352c41d20'
          '066945136ba4c87dc9f3423fb26c7cd89c58a39e')
sha256sums=('c33e2f747dd7a3143d2efa24e142a3197a1aea1f14b69fd9984809065109e12d'
            'a3a1c51fa48c5c9edb7717d5ec0b76bf035c0c517607ede98cb9137342f991c5'
            '1d8118e8dc2646e355decbbee450343032372d362f3d563cbf47c862676a2491')
sha384sums=('f215a68f9025ddd2ac31bc998ebade2cfb6142629b435e9c155b59dbfb2a13dabda2882a3e5b897ad0fba2abd948d972'
            '0a70ba63692020d1cfe8c853b6b54b4ba38275d05f830c9e87e2e593eca724a779ac4b737b27df92af9072b8973f6ea8'
            '17660e8c8003c17eebdbd92ae8c27ef69b4495a59e45123fc93d7dd462b84e1f6da532928a3c2db81229edae449217c9')
sha512sums=('405fd24247b0752459531b24bbfaec4913ce6933fc11550bb78c658d9091bbd17734affb9c595fd5287214f16871ef491c7ebce1ed53da6805aaffa2c6f5ba6c'
            '8350f609e9c9163419972fc4adcb200cde05c5f3ef473e792e52afa58ef139910315032c888055712bc6f6e68dbb06217e5f0468064c875fcecf74d320558a68'
            'c3fc2ec7334d3b3dec2e3db0b03ce44bb350f16c290aab44f57c63b33bdf0cb778ec8ca6e16e13f1c058fa5ba7a9a2d28bb4f052c3168f5c0c2ef2f93a84535b')
