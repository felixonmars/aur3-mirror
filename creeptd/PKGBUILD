pkgname=creeptd
pkgname_=CreepTD
pkgver=1
pkgrel=2
pkgdesc='multiplayer tower defense game'
url='http://www.creeptd.com/'
depends=('java-runtime')
arch=('any')
license=('custom')
source=("http://www.creeptd.com/download/$pkgname-linux.tar.gz")
sha256sums=('3113afa62f69717a01715ba72436e60186c4f9f8e4a9936c4307e222bbbc56c3')

function package()
{
  install -dm755 "$pkgdir/opt/$pkgname"
  cp -at "$pkgdir/opt/$pkgname" "$srcdir/$pkgname_"/*

  # Desktop file.
  # Update the Exec and Icon paths.
  sed -i \
    "s@\./CreepTD.ico@/opt/$pkgname/CreepTD.ico@;s@\./CreepTD@/usr/bin/CreepTD@" \
    "$pkgdir/opt/$pkgname/$pkgname_".desktop
  install -Dm644 \
    "$pkgdir/opt/$pkgname/$pkgname_".desktop \
    "$pkgdir"/usr/share/applications/"$pkgname_".desktop
  rm "$pkgdir/opt/$pkgname/$pkgname_".desktop

  # The application downloads files when run so it cannot be installed centrally
  # without global write permissions, which would be insecure and problematic.

  # Create a launcher script instead that copies the files.
  install -dm755 "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/$pkgname_" <<LAUNCH
#!/bin/sh
if [[ -z \$XDG_DATA_HOME ]]
then
  XDG_DATA_HOME=~/.local/share
fi
user_dir="\$XDG_DATA_HOME/$pkgname_"
mkdir -p -- "\$user_dir"
cp -aut "\$user_dir" "/opt/$pkgname"/*
cd "\$user_dir"
./"$pkgname_"
LAUNCH
  chmod 755 "$pkgdir/usr/bin/$pkgname_"
}

# For future reference.
  # This doesn't work because the application stupidly compares checksums.
#   # Launcher in /usr/bin.
#   sed -i \
#     's@path=`dirname $0`@self="$(readlink -f "$0")"\npath="${self%/*}"@;s@$path@"$path"@;' \
#     "$pkgdir/opt/$pkgname/$pkgname_"
#   install -dm755 "$pkgdir/usr/bin"
#   ln -s "/opt/$pkgname/$pkgname_" "$pkgdir/usr/bin/$pkgname_"
