# Maintainer: Jeremy Lynch <jl At adminempire d0t com>
pkgname=ec2-ami-tools
pkgver=1.5.6
pkgrel=1
pkgdesc="The Amazon EC2 AMI Tools are command-line utilities to help manage machine instances for Amazon S3."
arch=('any')
url="http://developer.amazonwebservices.com/"
# this is idiotic, completely and I blame amazon.  You can nolonger download
# per version of these files.  Sooo for now, till I learn a better method
# we will grab the .zip and use the md5 sum failure to make sure this is upto
#date
source=(http://s3.amazonaws.com/ec2-downloads/ec2-ami-tools-"${pkgver}".zip)
depends=('ruby' 'rsync')
license=('custom')
sha512sums=('77ce82acbccf32bb1b900ef0b8c7440d4fc05e9b883081432935c6fef94b1f27191a0147e73c9eec680eca94c62075ab81bb8b0c33bec56bb2b861876de0129d')

package() {
  if [ -e "$pkgname".zip ];then
    rm -rf "$pkgname".zip
  fi
  # I know, lets prevent people from downloading our
  # $pkgname-$pkgver-$_pkgbuild.zip file directly,
  # but then when they uncompress it lets label it!
  # Shame on amazon!
  cd "$srcdir"/"$pkgname"-"$pkgver"
  mkdir -p "$pkgdir"/usr
  cp -r lib "$pkgdir"/usr
  cp -r etc "$pkgdir"
  find "$pkgdir" -type f | xargs chmod 644
  sed -i 's#^home=.*$#home=/usr#' bin/*
  sed -i 's#^ruby #ruby-1.8 #' bin/*
  cp -r bin "$pkgdir"/usr
  mkdir -p "$pkgdir"/usr/share/licenses/"$pkgname"
  install -m 644 license.txt "$pkgdir"/usr/share/licenses/"$pkgname"
}


